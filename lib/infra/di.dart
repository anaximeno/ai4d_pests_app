import 'package:ai4d_pests_app/domain/controllers/classification.dart';
import 'package:get/get.dart';

abstract class DI {
  static void inject() {
    Get.lazyPut(() => ClassificationController(), fenix: true);
  }
}
