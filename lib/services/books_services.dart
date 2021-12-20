import 'dart:convert';

import 'package:bibliotheque/models/book.dart';
import 'package:http/http.dart' as http;

class BooksServices {
  static Future<List<Book>> getBooks() async {
    var client = http.Client();
    var url = Uri.parse('http://10.0.2.2:3000/Books');
    var response = await client.get(url);
    return List.from(jsonDecode(response.body))
        .map((element) => Book.fromJson(element))
        .toList();
  }

  static Future<Book> updateBook(Book book) async {
    var client = http.Client();
    var url = Uri.parse('http://10.0.2.2:3000/Books/${book.id}');
    var response = await client.put(url, body: book.toJson());
    return Book.fromJson(jsonDecode(response.body));
  }

  static Future<Book> addBook(Book book) async {
    var client = http.Client();
    var url = Uri.parse('http://10.0.2.2:3000/Books');
    print(book.toJson());
    var response;
    response = await client.post(url, body: book.toJson());

    return Book.fromJson(jsonDecode(response.body));
  }

  static Future<void> deleteBook(int id) async {
    var client = http.Client();
    print(id);

    var url = Uri.parse('http://10.0.2.2:3000/Book/$id');
    try {
      var response = await client.delete(url);
    } catch (e) {
      print(e.toString() + "erooooooooooor");
    }
  }
}
