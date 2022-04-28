
class Cards {
  String name;
  String image;
  String flavorText;
  String cropImage;

  Cards({
    required this.name,
    required this.image,
    required this.flavorText,
    required this.cropImage,
  });

factory Cards.fromMap(Map<String, dynamic> map) {
  return Cards(
    name: map['name'] ?? '',
    image: map['image'] ?? '',
    flavorText: map['flavorText'] ?? '',
    cropImage: map['cropImage'] ?? '',
    );
    
  }
}
