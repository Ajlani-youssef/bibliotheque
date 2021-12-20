import 'package:bibliotheque/models/book.dart';
import 'package:bibliotheque/services/books_services.dart';
import 'package:flutter/material.dart';

class AddBook extends StatelessWidget {
  AddBook({Key? key}) : super(key: key);
  TextEditingController controllerName = TextEditingController(text: "aa");
  TextEditingController controllerAuthor = TextEditingController(text: "aa");
  TextEditingController controllerDescription =
      TextEditingController(text: "aa");
  TextEditingController controllerImage = TextEditingController(text: "aa");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Book"),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 8,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: controllerName,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the book name',
                  ),
                ),
                TextFormField(
                  controller: controllerAuthor,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the book author',
                  ),
                ),
                TextFormField(
                  controller: controllerDescription,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the book description',
                  ),
                ),
                TextFormField(
                  controller: controllerImage,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the book image',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print(
                      controllerAuthor.text +
                          controllerDescription.text +
                          controllerImage.text +
                          controllerName.text,
                    );
                    Book book = Book(
                      author: controllerAuthor.text,
                      description: controllerDescription.text,
                      image: controllerImage.text,
                      name: controllerName.text,
                      saved: false,
                    );
                    print(book.name +
                        book.author +
                        book.description +
                        book.image);
                    BooksServices.addBook(book);
                    Navigator.of(context).pop();
                  },
                  child: Text("Add"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
