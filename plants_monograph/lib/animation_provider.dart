import 'package:flutter/foundation.dart';
import 'mono_model.dart';
import 'recent_added_data.dart';

class AnimationProvider extends ChangeNotifier {
  // GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  // List<Widget> recentList = [];

  // // var _price = service.price;

  // void _addRecentMonos() {
  //   List<Mono> _recents = recentMonos;

  //   Future ft = Future(() {});
  //   _recents.forEach((Mono mono) {
  //     ft = ft.then((data) {
  //       return Future.delayed(const Duration(milliseconds: 190), () {
  //         recentList.add(monoItem(mono));
  //         listKey.currentState.insertItem(recentList.length - 1);
  //       });
  //     });
  //     notifyListeners();
  //   });
  // }

  // Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  // int counter = 1;
  // int total;

  // void increaseprice() {
  //   final _price = data.price;

  //   counter++;
  //   total = _price * counter;
  //   notifyListeners();
  // }

  // void decreasePrice() {
  //   final _price = data.price;

  //   if (counter != 1) {
  //     counter--;
  //     total = _price * counter;
  //   }
  //   notifyListeners();
  // }

  // void initialTotal() {
  //   total = data.price;
  //   // notifyListeners();
  // }
}
