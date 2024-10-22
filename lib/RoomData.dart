class RoomData {
  String? name;
  String? details;
  String? imageUrl;
  String? price;

  RoomData({this.name, this.details, this.imageUrl, this.price});

  RoomData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    details = json['details'];
    imageUrl = json['imageUrl'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['details'] = this.details;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    return data;
  }
}
