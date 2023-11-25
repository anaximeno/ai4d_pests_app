import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageFileEntity {
  String name;

  Uint8List? bytes;

  String? path;

  ImageFileEntity({required this.name, this.bytes, this.path});

  Widget toImageWidget({double? width, double? height, BoxFit? fit}) =>
      path != null
          ? Image.file(File(path!), width: width, height: height, fit: fit)
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
}
