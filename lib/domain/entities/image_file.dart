import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ImageFileEntity {
  String name;
  String? path;
  Uint8List? bytes;
  File? _file;

  ImageFileEntity({required this.name, this.bytes, this.path}) {
    _file = path != null ? File(path!) : null;
  }

  Widget toImageWidget({double? width, double? height, BoxFit? fit}) =>
      _file != null
          ? Image.file(_file!, width: width, height: height, fit: fit)
          : bytes != null
              ? Image.memory(bytes!, width: width, height: height, fit: fit)
              : SizedBox(
                  width: width,
                  height: height,
                  child: const Text(
                    'Image could not be uploaded!',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                    ),
                  ),
                );

  MultipartFile? toMultipartFile() => MultipartFile.fromBytes(
        _file?.readAsBytesSync() ?? bytes ?? [],
        filename: name,
      );
}
