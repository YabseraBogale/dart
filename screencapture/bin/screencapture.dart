import 'dart:io';

void main() async {
  if (Platform.isWindows) {
    await Process.run('snippingtool', ['/clip']);
    print('Screenshot captured on Windows!');
  } else if (Platform.isMacOS) {
    await Process.run('screencapture', ['-x', 'screenshot.png']);
    print('Screenshot saved as screenshot.png on macOS!');
  } else if (Platform.isLinux) {
    await Process.run('spectacle', [' -b', '-o', 'screenshot.png']);
    print('Screenshot saved as screenshot.png on Linux!');
  } else {
    print('Platform not supported for screen capture.');
  }
}
