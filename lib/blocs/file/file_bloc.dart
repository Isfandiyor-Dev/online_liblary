// ignore_for_file: avoid_print

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:liblary_new/data/model/book.dart';
import 'package:liblary_new/data/repositories/book_repository.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import '../../services/permission_service.dart';

part 'file_event.dart';
part 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  FileBloc({
    required this.fileRepository,
  }) : super(FileState()) {
    on<GetFiles>(_onGetFiles);
    on<DownloadFile>(_onDownload);
    on<OpenFile>(_onOpen);
  }

  final BookRepository fileRepository;

  void _onGetFiles(
    GetFiles event,
    Emitter<FileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      // await Future.delayed(const Duration(seconds: 1));

      for (var file in fileRepository.books) {
        final fullPath = await _getSavePath(file);
        if (_checkFileExists(fullPath)) {
          file = file
            ..savePath = fullPath
            ..isDownloaded = true;
        }
      }

      emit(state.copyWith(
        files: fileRepository.books,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onDownload(
    DownloadFile event,
    Emitter<FileState> emit,
  ) async {
    if (await PermissionService.requestStoragePermission()) {
      final index = state.files!.indexWhere((f) {
        return event.file.id == f.id;
      });
      try {
        state.files![index].isLoading = true;
        emit(state.copyWith(files: state.files));

        final dio = Dio();
        final fullPath = await _getSavePath(event.file);
        if (_checkFileExists(fullPath)) {
          add(OpenFile(path: fullPath));
          state.files![index]
            ..isLoading = false
            ..savePath = fullPath
            ..isDownloaded = true;

          emit(state.copyWith(files: state.files));
        } else {
          print("yuklanmoqda");
          final response = await dio.download(
            event.file.downloadUrl,
            fullPath,
            onReceiveProgress: (count, total) {
              // count (byte) - qancha ma'lumot  yuklanganini aytadi
              // total (byte) - umumiy faylni hajmi
              print("${count / total}%");
              state.files![index].progress = count / total;
              emit(state.copyWith(files: state.files));
            },
          );
          print("${response.statusCode}");
          print("${response.statusMessage}");
          state.files![index]
            ..isLoading = false
            ..savePath = fullPath
            ..isDownloaded = true;
          emit(
            state.copyWith(files: state.files),
          );
        }
      } on DioException catch (e) {
        print("DIO EXCEPTION");
        // print("Dio xatoligi: $e");
        state.files![index].isLoading = false;
        emit(
          state.copyWith(
            files: state.files,
            errorMessage: e.response?.data,
          ),
        );
      } catch (e) {
        print("Dio xatoligi: $e");
        state.files![index].isLoading = false;
        emit(
          state.copyWith(
            files: state.files,
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  void _onOpen(
    OpenFile event,
    Emitter<FileState> emit,
  ) async {
    await OpenFilex.open(event.path);
  }

  bool _checkFileExists(String filePath) {
    final file = File(filePath);

    return file.existsSync();
  }

  Future<String> _getSavePath(Book file) async {
    Directory? savePath = await getApplicationDocumentsDirectory();
    if (Platform.isAndroid) {
      // savePath = Directory("/storage/emulated/0/download");
      savePath = await getDownloadsDirectory();
    }
    // iphone/application/documents
    final fileExtension =
        file.downloadUrl.split('.').last; // https://www.hp.com/video.mp4
    final fileName = "${file.title}.$fileExtension"; // Harry Potter Video.mp4
    final fullPath = "${savePath!.path}/$fileName";

    return fullPath;
  }
}
