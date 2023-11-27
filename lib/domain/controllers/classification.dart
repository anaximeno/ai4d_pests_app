import 'dart:developer';

import 'package:ai4d_pests_app/constants/loading_states.dart';
import 'package:ai4d_pests_app/domain/entities/classification_request.dart';
import 'package:ai4d_pests_app/domain/entities/classification_response.dart';
import 'package:ai4d_pests_app/domain/entities/image_file.dart';
import 'package:ai4d_pests_app/domain/repositories/classification.dart';
import 'package:ai4d_pests_app/ui/components/basic_alert_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ClassificationController extends GetxController {
  final ClassificationRepository _classificationRepository;

  final _image = Rxn<ImageFileEntity>();

  final _loading = Rx<LoadingState>(LoadingState.stopped);

  final _classificationResponse = Rxn<ClassificationResponseEntity>();

  // --- class initialization ---

  ClassificationController(this._classificationRepository);

  // --- class initialization ---

  ImageFileEntity? get image => _image.value;

  set image(ImageFileEntity? value) => _image.value = value;

  LoadingState get loading => _loading.value;

  set loading(LoadingState value) => _loading.value = value;

  bool get isLoading => _loading.value.isLoading();

  ClassificationResponseEntity? get classificationResponse =>
      _classificationResponse.value;

  set classificationResponse(ClassificationResponseEntity? value) =>
      _classificationResponse.value = value;

  void pickImageFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );

    if (result != null && result.files.single.extension == 'jpg') {
      String? path;

      try {
        path = result.files.single.path;
      } catch (e) {
        log(
          'File path could not be accessed, probably the file'
          ' is being uploaded to the browser, using bytes instead',
          error: e,
        );
      }

      image = ImageFileEntity(
        name: result.files.single.name,
        bytes: result.files.single.bytes,
        path: path,
      );

      classifyImage(image!);
    } else {
      Get.dialog(
        BasicAlertDialog(
          title: "Attention!",
          description: "Please select valid '.jpg' image file.",
          onOk: Get.back,
        ),
      );
    }
  }

  Future<void> classifyImage(ImageFileEntity image) async {
    try {
      classificationResponse = await _classificationRepository.classify(
        ClassificationRequestEntity(image),
      );
    } catch (e) {
      log("Got error while trying to classify the image!");
    }
  }
}
