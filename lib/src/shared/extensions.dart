import 'package:flutter/material.dart';

extension GroupToMainWrap on MainAxisAlignment {
  WrapAlignment toWrap() {
    switch (this) {
      case MainAxisAlignment.center:
        return WrapAlignment.center;
      case MainAxisAlignment.end:
        return WrapAlignment.end;
      case MainAxisAlignment.start:
        return WrapAlignment.start;
      case MainAxisAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case MainAxisAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case MainAxisAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
    }
  }
}

extension GroupToCrossWrap on CrossAxisAlignment {
  WrapCrossAlignment toWrap() {
    switch (this) {
      case CrossAxisAlignment.center:
        return WrapCrossAlignment.center;
      case CrossAxisAlignment.end:
        return WrapCrossAlignment.end;
      case CrossAxisAlignment.start:
        return WrapCrossAlignment.start;
      case CrossAxisAlignment.stretch:
        break;
      case CrossAxisAlignment.baseline:
        break;
    }
    return WrapCrossAlignment.center;
  }
}
