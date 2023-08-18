import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollDirectionController extends ChangeNotifier {
  ScrollDirection? currentScrollDirection;

  void idle() {
    if (currentScrollDirection != ScrollDirection.idle) {
      currentScrollDirection = ScrollDirection.idle;
      notifyListeners();
    }
  }

  void forward() {
    if (currentScrollDirection != ScrollDirection.idle) {
      currentScrollDirection = ScrollDirection.forward;
      notifyListeners();
    }
  }

  void reverse() {
    if (currentScrollDirection != ScrollDirection.idle) {
      currentScrollDirection = ScrollDirection.reverse;
      notifyListeners();
    }
  }

  void setScrollDirection(ScrollDirection scrollDirection) {
    if (currentScrollDirection != scrollDirection) {
      currentScrollDirection = scrollDirection;
      notifyListeners();
    }
  }
}
