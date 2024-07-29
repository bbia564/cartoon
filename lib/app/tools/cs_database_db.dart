import 'dart:math';

import 'package:cartoon_sale/app/modules/cartoon_list/controllers/cartoon_list_controller.dart';
import 'package:cartoon_sale/app/tools/cartoon_model.dart';
import 'package:cartoon_sale/app/tools/pm_share_per.dart';
import 'package:cartoon_sale/assets/assets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';

class CSDatabase extends GetxService {
  late Database db;

  Future<CSDatabase> init() async {
    await initDB();
    return this;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cartoon_database.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createTable(db);
    });

    refreshHomeData();
  }

  void refreshHomeData() async {
    final hasData = CSSharedPreferences.getBool("has_initail_models") ?? false;
    if (hasData) {
      if (Get.isRegistered<CartoonListController>()) {
        Get.find<CartoonListController>().loadAllCartoons();
      }
      return;
    }
    final total_count = 10 + Random().nextInt(200);
    final total_price = 100 + Random().nextInt(5000);

    CSSharedPreferences.putInt("total_count", total_count);
    CSSharedPreferences.putInt("total_price", total_price);

    await Future.delayed(const Duration(milliseconds: 100));

    final books = [
      {
        "name": "X-MEN: BLOOD HUNT - MAGIK #1 [BH] (2024) #1",
        "photo": "",
        "localPhoto": Assets.magik,
        "amount": 0,
        "pubTime": "June 26, 2024",
      },
      {
        "name": "THANOS ANNUAL #1 [IW] (2024) #1",
        "photo": "",
        "localPhoto": Assets.magik1,
        "amount": 0,
        "pubTime": "June 26, 2024",
      },
      {
        "name": "CHEE'ILTH (2023) #1",
        "photo": "",
        "localPhoto": Assets.chee,
        "amount": 0,
        "pubTime": "October 03, 2023",
      },
      {
        "name": "G.O.D.S. FIRST LOOK INFINITY COMIC (2023) #1",
        "photo": "",
        "localPhoto": Assets.gods,
        "amount": 0,
        "pubTime": "October 04, 2023",
      },
      {
        "name": "LOKI: AGENT OF ASGARD INFINITY COMIC (2023) #10",
        "photo": "",
        "localPhoto": Assets.loki,
        "amount": 0,
        "pubTime": "October 03, 2023",
      },
      {
        "name": "THE VITALS: TRUE EMS STORIES (2021)",
        "photo": "",
        "localPhoto": Assets.loki,
        "amount": 0,
        "pubTime": "June 01, 2021",
      }
    ];

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cartoon_database.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});

    var index = 1;
    for (var element in books) {
      final model = CartoonModel.fromJson(element);
      model.amount = 1000 + Random().nextInt(3000);
      model.price = 10 + Random().nextInt(50);
      await db.insert('cartoon_table', {
        'name': model.name,
        'photo': model.photo,
        'amount': model.amount,
        "price": model.price,
        'pubTime': model.pubTime,
        'localPhoto': model.localPhoto,
      });

      final count = 5 + Random().nextInt(6);
      for (var i = 0; i < count; i++) {
        final sale = CSSaleModel();
        sale.cID = index;
        sale.amount = 1 + Random().nextInt(20);
        sale.saleDate =
            "2024-${1 + Random().nextInt(7)}-${1 + Random().nextInt(31)}";
        await db.insert('sales_table', {
          'cID': sale.cID,
          'amount': sale.amount,
          'saleDate': sale.saleDate,
        });
      }

      index++;
    }

    await CSSharedPreferences.putBool("has_initail_models", true);

    if (Get.isRegistered<CartoonListController>()) {
      Get.find<CartoonListController>().loadAllCartoons();
    }
  }

  createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS  cartoon_table (id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT ,price INT ,amount INT, photo TEXT, localPhoto TEXT, pubTime TEXT)');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS sales_table (id INTEGER PRIMARY KEY AUTOINCREMENT, cID INT, amount INT,saleDate TEXT  , birth INT,FOREIGN KEY (cID) REFERENCES sales_table(id))');
  }

  Future<void> insertCartoonData(CartoonModel model) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cartoon_database.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.insert('cartoon_table', {
      'name': model.name,
      "price": model.price,
      'photo': model.photo,
      'amount': model.amount,
      'pubTime': model.pubTime,
      'localPhoto': model.localPhoto,
    });
  }

  Future<void> insertSaleRecord(CSSaleModel item) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cartoon_database.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.insert('sales_table', {
      'cID': item.cID,
      'amount': item.amount,
      'saleDate': item.saleDate,
    });
  }

  Future<void> clean({bool onlySele = false}) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cartoon_database.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    if (onlySele) {
      await db.delete('sales_table');
    } else {
      await db.delete('cartoon_table');
    }
  }

  Future<List<CartoonModel>> allCartoon() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cartoon_database.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    var result = await db.query('cartoon_table', orderBy: 'id DESC');
    return result.map((e) => CartoonModel.fromJson(e)).toList();
  }

  Future<List<CSSaleModel>> getAllSaleDetail({int? cid}) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cartoon_database.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});

    var result = await db.query('sales_table',
        where: 'cID = ?', whereArgs: [cid], orderBy: 'id DESC');
    return result.map((e) => CSSaleModel.fromJson(e)).toList();
  }
}
