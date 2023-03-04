import 'package:flutter/widgets.dart';

class CustomFont {
  CustomFont._();

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData heart =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData heartEmpty =
      IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData download =
      IconData(0xe82d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData share =
      IconData(0xe8a1, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
