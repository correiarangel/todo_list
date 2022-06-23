
import 'dart:io' show Directory;

import 'package:path_provider/path_provider.dart';
import 'package:flutter_test/flutter_test.dart';


const String kApplicationSupportPath = '/home/rangel/.local/share/flutter_tester';


void main() {
  test('getApplicationSupportDirectory', () async {
    final Directory result = await getApplicationSupportDirectory();
    expect(result.path, kApplicationSupportPath);
  });
  test('getApplicationDocumentsDirectory throws on null', () async {
    expect(getApplicationDocumentsDirectory(),
        throwsA(isA<Directory>()));
  });
}
