import 'dart:io';

import 'package:image/image.dart';

void main() async {
  Image? image = await decodePngFile("wall.png");
  Image? newimage =
      Image(width: image?.data?.width ?? 0, height: image?.data?.height ?? 0);
  for (var y = 0; y < (image?.data?.height ?? 0); y++) {
    for (var x = 0; x < (image?.data?.width ?? 0); x++) {
      var pixel = image?.getPixel(x, y);
      newimage.setPixelRgb(x, y, pixel?.r ?? 0, pixel?.g ?? 0, pixel?.b ?? 0);
    }
  }
  await File("newimage.png").writeAsBytes(encodePng(newimage));
}
