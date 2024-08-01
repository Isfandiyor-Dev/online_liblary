part of 'file_bloc.dart';

final class FileState {
  List<Book>? files;
  String? errorMessage;
  bool isLoading;

  FileState({
    this.files,
    this.errorMessage,
    this.isLoading = false,
  });

  FileState copyWith({
    List<Book>? files,
    String? errorMessage,
    bool? isLoading,
  }) {
    return FileState(
      files: files ?? this.files,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
