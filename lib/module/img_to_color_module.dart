import 'package:palette_generator/palette_generator.dart';
import 'package:flutter/material.dart';

class GetImageColor {
  static Future<Color> getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor.color;
  }
}
