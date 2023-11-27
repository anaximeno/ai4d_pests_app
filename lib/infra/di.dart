import 'package:ai4d_pests_app/domain/controllers/classification.dart';
import 'package:ai4d_pests_app/domain/repositories/classification.dart';
import 'package:ai4d_pests_app/infra/api.dart';
import 'package:get/get.dart';

abstract class DI {
  static void inject() {
    Get.lazyPut(() => Api(), fenix: true);
    Get.lazyPut(() => ClassificationRepository(Get.find()), fenix: true);
    Get.lazyPut(() => ClassificationController(Get.find()), fenix: true);
  }
}
