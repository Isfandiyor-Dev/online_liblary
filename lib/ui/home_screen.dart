import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liblary_new/blocs/export_blocs.dart';
import 'package:liblary_new/ui/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Book Liblary"),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
      body: BlocBuilder<FileBloc, FileState>(
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

            final files = state.files!;
            return GridView.builder(
              itemCount: files.length,
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 240,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => DetailScreen(
                          book: files[index],
                          index: index,
                        ),
                      ),
                    );
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 140,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[500],
                            image: DecorationImage(
                              image: NetworkImage(files[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          files[index].title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            height: 2.5,
                          ),
                        ),
                        Text(
                          files[index].author,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
