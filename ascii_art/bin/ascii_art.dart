import 'package:image/image.dart';

void main() async {
  Image? image = await decodePngFile("wall.png");
  for (var x = 0; x < (image?.data?.maxChannelValue ?? 0); x++) {
    for (var y = 0; y < (image?.data?.maxChannelValue ?? 0); y++) {
      print(image?.getPixel(x, y));
    }
  }
}
