import 'dart:developer';

import 'package:ai4d_pests_app/domain/entities/classification_request.dart';
import 'package:ai4d_pests_app/domain/entities/classification_response.dart';
import 'package:ai4d_pests_app/domain/entities/image_file.dart';
import 'package:ai4d_pests_app/domain/entities/pest.dart';
import 'package:ai4d_pests_app/domain/repositories/classification.dart';
import 'package:ai4d_pests_app/domain/repositories/pests.dart';
import 'package:ai4d_pests_app/helpers/loading_manager.dart';
import 'package:ai4d_pests_app/ui/components/basic_alert_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ClassificationController extends GetxController with LoadingManaganer {
  final ClassificationRepository _classificationRepository;

  final PestsRepository _pestsRepository;

  final _image = Rxn<ImageFileEntity>();

  final _classificationResponse = Rxn<ClassificationResponseEntity>();

  final _classifiedPestEntity = Rxn<PestEntity>();

  // --- class initialization ---

  ClassificationController(
    this._classificationRepository,
    this._pestsRepository,
  );

  // --- class initialization ---

  ImageFileEntity? get image => _image.value;

  set image(ImageFileEntity? value) => _image.value = value;

  PestEntity? get classifiedPestEntity => _classifiedPestEntity.value;

  set classifiedPestEntity(PestEntity? value) =>
      _classifiedPestEntity.value = value;

  ClassificationResponseEntity? get classificationResponse =>
      _classificationResponse.value;

  set classificationResponse(ClassificationResponseEntity? value) =>
      _classificationResponse.value = value;

  void pickImageFile() async {
    addLoadingFor(pickImageFile.hashCode);

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

      removeLoadingFor(pickImageFile.hashCode);
      classifyImage(image!);
    } else {
      removeLoadingFor(pickImageFile.hashCode);
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
    addLoadingFor(classifyImage.hashCode);

    try {
      classificationResponse = await _classificationRepository.classify(
        ClassificationRequestEntity(image),
      );

      if (classificationResponse?.output?.result?.label != null) {
        getClassifiedPestInfo(classificationResponse!.output!.result!.label!);
      }

      removeLoadingFor(classifyImage.hashCode);
    } catch (e) {
      log("Got error while trying to classify the image!", error: e);
      removeLoadingFor(classifyImage.hashCode);

      Get.dialog(
        BasicAlertDialog(
          title: "Error!",
          description: "Got an error while trying to classify the image!"
              " Please try again!",
          onOk: () {
            this.image = null;
            Get.back();
          },
        ),
      );
    }
  }

  Future<void> getClassifiedPestInfo(String label) async {
    addLoadingFor(getClassifiedPestInfo.hashCode);
    try {
      classifiedPestEntity = await _pestsRepository.getPestBySlug(label);
      removeLoadingFor(getClassifiedPestInfo.hashCode);
    } catch (e) {
      removeLoadingFor(getClassifiedPestInfo.hashCode);
      log(
        "Got error while trying to get more information of the classified pest!",
        error: e,
      );
    }
  }

  void reset() {
    image = null;
    classifiedPestEntity = null;
    classificationResponse = null;
  }
}
