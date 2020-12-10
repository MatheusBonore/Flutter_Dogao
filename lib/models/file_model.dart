class FileModel {
  List<String> files;
  String folder;

  FileModel({
    this.files,
    this.folder,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      files: json['files'].cast<String>(),
      folder: json['folderName'],
    );
  }
}
