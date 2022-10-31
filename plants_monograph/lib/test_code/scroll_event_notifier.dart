
import 'package:flutter/foundation.dart';

class ScrollEventNotifier with ChangeNotifier {

  bool _isScrolling;
  ScrollEventNotifier(this._isScrolling);
 
  get isScrolling => _isScrolling; 
  
  set isScrolling (bool scrollStatus) {
    _isScrolling = scrollStatus;
    notifyListeners();
  }
  
}