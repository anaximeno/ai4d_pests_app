import 'dart:developer';

import 'package:ai4d_pests_app/domain/entities/pest.dart';
import 'package:ai4d_pests_app/domain/repositories/pests.dart';
import 'package:ai4d_pests_app/helpers/loading_manager.dart';
import 'package:get/get.dart';

class InformationController extends GetxController {
  final PestsRepository _pestsRepository;

  final LoadingManaganer _loadingManaganer;

  final _pestsList = RxList(<PestEntity>[]);

  InformationController(this._loadingManaganer, this._pestsRepository) {
    getPests();
  }

  List<PestEntity> get pestsList => _pestsList;

  set pestsList(List<PestEntity> value) => _pestsList.value = value;

  void getPests() async {
    _loadingManaganer.addLoading(getPests.hashCode);
    try {
      pestsList = await _pestsRepository.getAllPests();
    } catch (e) {
      log("Couldn't get all pests!", error: e);
    }
    _loadingManaganer.removeLoading(getPests.hashCode);
  }
}
