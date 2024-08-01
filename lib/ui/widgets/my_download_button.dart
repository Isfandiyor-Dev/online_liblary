import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liblary_new/blocs/export_blocs.dart';

class MyDownloadButton extends StatelessWidget {
  final int index;
  const MyDownloadButton({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FileBloc, FileState>(
        bloc: context.read<FileBloc>()..add(GetFiles()),
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.errorMessage != null) {
            return Center(
              child: Text(state.errorMessage!),
            );
          }

          if (state.files == null || state.files!.isEmpty) {
            return const Center(
              child: Text("Fayllar mavjud emas"),
            );
          }

          final book = state.files![index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FloatingActionButton(
                        onPressed: () {
                          if (book.isDownloaded) {
                            context
                                .read<FileBloc>()
                                .add(OpenFile(path: book.savePath));
                          } else {
                            context
                                .read<FileBloc>()
                                .add(DownloadFile(file: book));
                          }
                        },
                        child: book.isLoading
                            ? const Text("Downloading...")
                            : book.isDownloaded
                                ? const Icon(
                                    Icons.check_circle_sharp,
                                    color: Colors.green,
                                  )
                                : const Text("Download"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if (book.isLoading)
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: book.progress.toDouble(),
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  )
              ],
            ),
          );
        });
  }
}
