import 'package:bibliotheque/models/book.dart';
import 'package:bibliotheque/models/dummy_data.dart';
import 'package:bibliotheque/screens/add_book.dart';
import 'package:flutter/material.dart';
import '../services/books_services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Books",
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark,
              ),
            ),
          ],
        ),
        body: FutureBuilder<List<Book>>(
          future: BooksServices.getBooks(), // async work
          builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(snapshot.data![index].image),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(snapshot.data![index].name),
                                Text(snapshot.data![index].author),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    snapshot.data![index].description,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    BooksServices.deleteBook(
                                            snapshot.data![index].id!)
                                        .then((value) {
                                      setState(() {});
                                    });
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                                IconButton(
                                  onPressed: () {
                                    snapshot.data![index].name = "hello3";
                                  },
                                  icon: Icon(
                                    snapshot.data![index].saved
                                        ? Icons.bookmark_outlined
                                        : Icons.bookmark_border,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => AddBook(),
            ),
          )
              .then((value) {
            setState(() {});
          }),
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
