import 'package:flutter/cupertino.dart';

class Book {
  int? id;
  String name;
  String author;
  String description;
  String image;
  bool saved;

  Book({
    this.id,
    required this.author,
    required this.description,
    required this.image,
    required this.name,
    required this.saved,
  });

  factory Book.fromJson(Map<String, dynamic> entrer) {
    return Book(
      id: entrer["id"],
      name: entrer["name"],
      author: entrer["author"],
      description: entrer["description"],
      image: entrer["image"],
      saved: entrer["saved"].toString().toLowerCase() == 'true',
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "author": author,
        "description": description,
        "image": image,
        "saved": saved.toString(),
      };
}
