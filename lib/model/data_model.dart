class DataModel {
  String name;
  String img;
  int price;
  int people;
  int description;
  int location;

  DataModel({required this.description, required this.name, required this.img, required this.price, required this.people, required this.location });

  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(
      description: json["description"], 
      name: json["name"], 
      img: json["img"], 
      price: json["price"], 
      people: json["people"], 
      location: json["location"]
    );
  }
}