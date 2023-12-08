import 'dart:developer';

import 'package:ai4d_pests_app/constants/routes.dart';
import 'package:ai4d_pests_app/domain/entities/pest.dart';
import 'package:ai4d_pests_app/domain/repositories/pests.dart';
import 'package:ai4d_pests_app/helpers/loading_manager.dart';
import 'package:get/get.dart';

class InformationController extends GetxController with LoadingManaganer {
  final PestsRepository _pestsRepository;

  final _pestsList = RxList(<PestEntity>[]);

  InformationController(this._pestsRepository) {
    getPests();
  }

  List<PestEntity> get pestsList => _pestsList;

  set pestsList(List<PestEntity> value) => _pestsList.value = value;

  void getPests() async {
    addLoadingFor(getPests.hashCode);
    try {
      pestsList = await _pestsRepository.getAllPests();
    } catch (e) {
      log("Couldn't get all pests!", error: e);
    }
    removeLoadingFor(getPests.hashCode);
  }

  void showInfoForPestByIndex(int index) {
    final item = pestsList[index];

    Get.toNamed(
      Routes.SELECT_PEST_INFORMATION,
      arguments: item,
      parameters: {'slug': item.slug ?? 'undefined'},
    );
  }
}
