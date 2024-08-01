import 'package:flutter/material.dart';
import 'package:liblary_new/ui/widgets/my_download_button.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.grey[200],
      floatingActionButton: const MyDownloadButton(),
      appBar: AppBar(
        title: const Text(
          "Tittle book",
          style: TextStyle(
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
          title: const Text(
            "Author",
            style: TextStyle(
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
                ),
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
            child: const SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Bu zo'r kitob, menga yoqadi",
                    style: TextStyle(
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
