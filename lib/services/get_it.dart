import 'package:get_it/get_it.dart';

import '../blocs/export_blocs.dart';
import '../data/repositories/book_repository.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton(BookRepository());

  getIt.registerSingleton(
    FileBloc(
      fileRepository: getIt.get<BookRepository>(),
    ),
  );
}
