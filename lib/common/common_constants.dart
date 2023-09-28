import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@sealed
class Gap {
  const Gap._();

  /// Height
  static const Widget h2 = SizedBox(height: 2);
  static const Widget h3 = SizedBox(height: 3);
  static const Widget h4 = SizedBox(height: 4);
  static const Widget h8 = SizedBox(height: 8);
  static const Widget h10 = SizedBox(height: 10);
  static const Widget h12 = SizedBox(height: 12);
  static const Widget h14 = SizedBox(height: 14);
  static const Widget h16 = SizedBox(height: 16);
  static const Widget safeArea = SizedBox(height: 16);
  static const Widget h20 = SizedBox(height: 20);
  static const Widget h24 = SizedBox(height: 24);
  static const Widget h28 = SizedBox(height: 28);
  static const Widget h32 = SizedBox(height: 32);
  static const Widget h40 = SizedBox(height: 40);
  static const Widget h48 = SizedBox(height: 48);
  static const Widget h64 = SizedBox(height: 64);
  static const Widget h100 = SizedBox(height: 100);

  /// Width
  static const Widget w2 = SizedBox(width: 2);
  static const Widget w3 = SizedBox(width: 3);
  static const Widget w4 = SizedBox(width: 4);
  static const Widget w5 = SizedBox(width: 5);
  static const Widget w8 = SizedBox(width: 8);
  static const Widget w10 = SizedBox(width: 10);
  static const Widget w11 = SizedBox(width: 11);
  static const Widget w12 = SizedBox(width: 12);
  static const Widget w16 = SizedBox(width: 16);
  static const Widget w20 = SizedBox(width: 20);
  static const Widget w24 = SizedBox(width: 24);
  static const Widget w28 = SizedBox(width: 28);
  static const Widget w32 = SizedBox(width: 32);
}

class Edge {
  static const EdgeInsets zero = EdgeInsets.zero;
  static const EdgeInsets top2 = EdgeInsets.fromLTRB(0, 2, 0, 0);
  static const EdgeInsets top16 = EdgeInsets.fromLTRB(0, 16, 0, 0);
  static const EdgeInsets top24 = EdgeInsets.fromLTRB(0, 24, 0, 0);

  static const EdgeInsets edge0_8 = EdgeInsets.fromLTRB(0, 8, 0, 8);
  static const EdgeInsets edge0_12 = EdgeInsets.fromLTRB(0, 12, 0, 12);
  static const EdgeInsets edge4_0 = EdgeInsets.fromLTRB(4, 0, 4, 0);
  static const EdgeInsets edge7_12 = EdgeInsets.fromLTRB(7, 12, 7, 12);
  static const EdgeInsets edge8_4 = EdgeInsets.fromLTRB(8, 4, 8, 4);
  static const EdgeInsets edge12_0 = EdgeInsets.fromLTRB(12, 0, 12, 0);
  static const EdgeInsets edge13_4 = EdgeInsets.fromLTRB(13, 4, 13, 4);
  static const EdgeInsets edge16_4 = EdgeInsets.fromLTRB(16, 4, 16, 4);
  static const EdgeInsets edge16_6 = EdgeInsets.fromLTRB(16, 6, 16, 6);
  static const EdgeInsets edge16_8 = EdgeInsets.fromLTRB(16, 8, 16, 8);
  static const EdgeInsets edge16_12 = EdgeInsets.fromLTRB(16, 12, 16, 12);
  static const EdgeInsets edge16_20 = EdgeInsets.fromLTRB(16, 20, 16, 20);
  static const EdgeInsets edge16_24 = EdgeInsets.fromLTRB(16, 24, 16, 24);
  static const EdgeInsets edge20_12 = EdgeInsets.fromLTRB(20, 12, 20, 12);
  static const EdgeInsets edge20_16 = EdgeInsets.fromLTRB(20, 16, 20, 16);
  static const EdgeInsets edge20_24 = EdgeInsets.fromLTRB(20, 24, 20, 24);
  static const EdgeInsets edge24_0 = EdgeInsets.fromLTRB(24, 0, 24, 0);
  static const EdgeInsets edge24_12 = EdgeInsets.fromLTRB(24, 12, 24, 12);
  static const EdgeInsets edge24_16 = EdgeInsets.fromLTRB(24, 16, 24, 16);
  static const EdgeInsets edge24_24 = EdgeInsets.fromLTRB(24, 24, 24, 24);
  static const EdgeInsets edge24_32 = EdgeInsets.fromLTRB(24, 32, 24, 32);
  static const EdgeInsets edge32_8 = EdgeInsets.fromLTRB(32, 8, 32, 8);
}

class Durations {
  static const Duration ms100 = Duration(milliseconds: 100);
  static const Duration ms200 = Duration(milliseconds: 200);
  static const Duration ms300 = Duration(milliseconds: 300);
  static const Duration ms400 = Duration(milliseconds: 400);
  static const Duration ms500 = Duration(milliseconds: 500);
  static const Duration ms1000 = Duration(milliseconds: 1000);
}

const emptyView = SizedBox.shrink();

const disabledOpacity = 0.4;
