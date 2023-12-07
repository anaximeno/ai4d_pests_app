import 'package:get/get.dart';

mixin LoadingManaganer implements GetxController {
  final _loadingArguments = RxList();

  bool isLoadingFor(dynamic argument) => _loadingArguments.contains(argument);

  void addLoadingFor(dynamic argument) => _loadingArguments.add(argument);

  void resetLoadingState() => _loadingArguments.value = [];

  void removeLoadingFor(dynamic argument) {
    _loadingArguments.removeWhere((value) => value == argument);
  }
}
