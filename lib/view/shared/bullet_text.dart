import 'package:flutter/material.dart';

class BulletText extends Text {
  const BulletText(
    String data, {
    required Key key,
    required TextStyle style,
    required TextAlign textAlign,
    required TextDirection textDirection,
    required Locale locale,
    required bool softWrap,
    required TextOverflow overflow,
    required double textScaleFactor,
    required int maxLines,
    required String semanticsLabel,
  }) : super(
          '• $data',
          key: key,
          style: style,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
        );
}