import 'package:ai4d_pests_app/domain/controllers/classification.dart';
import 'package:ai4d_pests_app/domain/repositories/classification.dart';
import 'package:ai4d_pests_app/domain/repositories/pests.dart';
import 'package:ai4d_pests_app/helpers/loading_manager.dart';
import 'package:ai4d_pests_app/infra/api.dart';
import 'package:ai4d_pests_app/infra/env.dart';
import 'package:get/get.dart';

abstract class DI {
  static void inject() {
    Get.put(Env(), permanent: true);
    Get.put(Api(Get.find()), permanent: true);
    Get.put(LoadingManaganer(), permanent: true);
    Get.lazyPut(() => ClassificationRepository(Get.find()), fenix: true);
    Get.lazyPut(() => PestsRepository(Get.find()), fenix: true);
    Get.lazyPut(
      () => ClassificationController(Get.find(), Get.find(), Get.find()),
      fenix: true,
    );
  }
}
