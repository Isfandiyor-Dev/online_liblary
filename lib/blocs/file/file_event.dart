part of 'file_bloc.dart';

sealed class FileEvent {}

final class GetFiles extends FileEvent {}

final class DownloadFile extends FileEvent {
  final Book file;

  DownloadFile({
    required this.file,
  });
}

final class OpenFile extends FileEvent {
  final String path;

  OpenFile({required this.path});
}

