// import 'package:ai4d_pests_app/constants/loading_states.dart';
import 'package:get/get.dart';

class LoadingManaganer extends GetxController {
  final _loadingArguments = RxList();

  void addLoading(dynamic argument) => _loadingArguments.add(argument);

  bool isLoading(dynamic argument) => _loadingArguments.contains(argument);

  void clearLoadingValues() => _loadingArguments.value = [];

  void removeLoading(dynamic argument) => _loadingArguments.removeWhere(
        (value) => value == argument,
      );
}
