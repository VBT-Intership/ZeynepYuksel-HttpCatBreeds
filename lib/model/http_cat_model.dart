class HttpCatModel {
  String breed;
  int id;
  String image;

  HttpCatModel({this.breed, this.id, this.image});

  HttpCatModel.fromJson(Map<String, dynamic> json) {
    breed = json['breed'];
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['breed'] = this.breed;
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
