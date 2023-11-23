import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ClassificationController extends GetxController {
  final _file = Rxn<File>();

  ClassificationController();

  File? get file => _file.value;

  set file(File? value) => _file.value = value;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ["jpg"],
    );

    if (result != null) {
      file = File(result.files.single.path!);
    } else {
      log("File not picked by the user!");
    }
  }
}
