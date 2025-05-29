import 'dart:io';
import 'dart:js_interop';

import 'package:excel/excel.dart';

void main(List<String> arguments) async {
  var p = File("./paper.xlsx").readAsBytesSync();
  var paper = Excel.decodeBytes(p);

  for (var table in paper.tables.keys) {
    for (var row in paper.tables[table]!.rows) {
      print("${row.where((cell) => cell != null).map((cell) => cell!.value)}");
    }
  }
}
