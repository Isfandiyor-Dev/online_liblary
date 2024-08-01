import 'package:flutter/material.dart';

class MyDownloadButton extends StatelessWidget {
  const MyDownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FloatingActionButton(
                onPressed: () {},
                child: const Text("Download"),
              ),
            ),
          ],
        ),
      );
  }
}