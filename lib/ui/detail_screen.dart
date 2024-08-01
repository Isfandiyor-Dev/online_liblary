import 'package:flutter/material.dart';
import 'package:liblary_new/data/model/book.dart';
import 'package:liblary_new/ui/widgets/my_download_button.dart';

class DetailScreen extends StatelessWidget {
  final Book book;
  final int index;
  const DetailScreen({
    super.key,
    required this.book,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.grey[200],
      floatingActionButton: MyDownloadButton(
        index: index,
      ),
      appBar: AppBar(
        title: Text(
          book.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.fade,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 45,
        backgroundColor: Colors.grey[300],
        bottom: AppBar(
          toolbarHeight: 30,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.grey[300],
          title: Text(
            book.author,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    image: DecorationImage(
                      image: NetworkImage(book.imageUrl),
                      fit: BoxFit.cover,
                    )),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Text(
              "Descrtiption",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    book.description,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
