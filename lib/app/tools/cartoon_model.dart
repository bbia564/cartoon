
class CartoonModel {
  int? id;
  String? name;
  String? photo;
  int? amount;
  int? price;
  String? pubTime;
  String? localPhoto;

  CartoonModel(
      {this.id,
      this.name,
      this.photo,
      this.amount,
      this.localPhoto,
      this.pubTime,
      this.price});

  CartoonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    pubTime = json['pubTime'];
    amount = json['amount'];
    price = json['price'];
    localPhoto = json['localPhoto'];
  }
}

class CSSaleModel {
  int? id;
  int? cID;
  int? amount;
  String? saleDate;

  CSSaleModel({this.id, this.cID, this.amount, this.saleDate});

  CSSaleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cID = json['cID'];
    amount = json['amount'];
    saleDate = json['saleDate'];
  }
}
