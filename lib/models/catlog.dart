class CatlogModel{
  static List<Item> items=[];
}

class Item{
  final int id;
  final String name;
  final String desc;
  final String color;
  final num price;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.color, required this.price, required this.image});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      color: map["color"],
      price: map["price"],
      image: map["image"]
    );
  }


  toMap() => {
    "id": id,
    "name": name,
    "desc": desc,
    "color": color,
    "price": price,
    "image": image
  };
}
