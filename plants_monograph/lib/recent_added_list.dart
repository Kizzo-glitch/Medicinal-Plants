import 'package:flutter/material.dart';
import 'mono_model.dart';
import 'recent_added_data.dart';
// import 'package:provider/provider.dart';
// import 'animation_provider.dart';

class RecentAddedList extends StatefulWidget {
  @override
  _RecentAddedListState createState() => _RecentAddedListState();
}

class _RecentAddedListState extends State<RecentAddedList> {
  List<Widget> _recentList = [];

  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    // final _providerInstance = Provider.of<AnimationProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addRecentMonos();
    });
  }

  void _addRecentMonos() {
    List<Mono> _recents = recentMonos;

    Future ft = Future(() {});
    _recents.forEach((Mono mono) {
      ft = ft.then((data) {
        return Future.delayed(const Duration(milliseconds: 190), () {
          _recentList.add(monoItem(mono));
          _listKey.currentState.insertItem(_recentList.length - 1);
        });
      });
    });
  }

  Widget monoItem(Mono mono) {
    return AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), image: DecorationImage(image: NetworkImage(mono.image), fit: BoxFit.cover)),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2),
                ])),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                mono.title,
                style: TextStyle(color: Colors.white, fontSize: 18, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ));
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return
        // Consumer<AnimationProvider>(
        // builder: (_, AnimationProvider, child) =>
        AnimatedList(
            scrollDirection: Axis.horizontal,
            key: _listKey,
            initialItemCount: _recentList.length,
            // itemCount: _mostList.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(position: animation.drive(_offset), child: _recentList[index]);
              // ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   key: _listKey,
              //   itemCount: _recentList.length,
              //   itemBuilder: (context, index) {
              //     return _recentList[index];
            }
            // )
            );
  }
}
