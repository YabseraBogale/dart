import 'package:image/image.dart';

void main() async {
  Image? image = await decodePngFile("wall.png");
  print("the length ${image?.length}\n");
}
