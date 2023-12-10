import 'dart:convert';
import 'dart:developer';

import 'package:ai4d_pests_app/infra/api.dart';
import 'package:flutter/services.dart';

class Env {
  final String configFilePath;

  String _apiAddress = "";

  String _apiAccessToken = "";

  int _cacheExpireMinutes = DEFAULT_CACHE_EXPIRE_MINUTES;

  Env({this.configFilePath = "assets/configs/env.json"});

  void loadConfigs() async {
    await rootBundle.loadString(configFilePath).then((value) {
      final configs = jsonDecode(value) as Map<String, dynamic>;

      // --- start get configs

      _apiAccessToken = configs["API"]["ACCESS_TOKEN"];
      _apiAddress = configs["API"]["ADDRESS"];
      _cacheExpireMinutes = configs["CACHE_EXPIRE_MINUTES"];

      // --- end get configs

      log("Env: configs loaded!");
    }).onError((error, trace) {
      log(
        "Env config couldn't be loaded successfully",
        error: error,
        stackTrace: trace,
      );
    });
  }

  String get apiAddress => _apiAddress;

  String get apiAccessToken => _apiAccessToken;

  int get cacheExpireMinutes => _cacheExpireMinutes;
}
