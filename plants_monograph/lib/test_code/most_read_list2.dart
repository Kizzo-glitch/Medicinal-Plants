import 'package:flutter/material.dart';
import 'model.dart';


class MostReadList2 extends StatefulWidget {
  @override
  _MostReadList2State createState() => _MostReadList2State();
}

class _MostReadList2State extends State<MostReadList2> {

  List<Widget> _mostList = [];
  // final GlobalKey _listKey = GlobalKey();
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

   @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      _addMostMonos();
    });
  }

  void _addMostMonos() {
    // get data from db
    List<Mono> _mosts = [
        Mono(image: 'https://images-prod.healthline.com/hlcmsresource/images/3347-rosemary-400x400-icon.jpg', 
          title: 'Sutherlandia monograph'),
        Mono(image: 'https://images-prod.healthline.com/hlcmsresource/images/3347-rosemary-400x400-icon.jpg', 
          title: 'Helichrysum Odoratissimum'),
        Mono(image: 'https://images-prod.healthline.com/hlcmsresource/images/3347-rosemary-400x400-icon.jpg', 
          title: 'Lippia javanica'),
        Mono(image: 'https://images-prod.healthline.com/hlcmsresource/images/3347-rosemary-400x400-icon.jpg', 
          title: 'Helichrysum Petiolare')
    ];

    Future ft = Future((){});
    _mosts.forEach((Mono mono) {
       ft = ft.then((data) {
        return Future.delayed(const Duration(milliseconds: 190), () {
          _mostList.add(monoItem(mono));
          _listKey.currentState.insertItem(_mostList.length - 1);
        });
      });
    });
  }

  Widget monoItem(Mono mono) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(mono.image),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ]
            )
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(mono.title, 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 18,
              fontStyle: FontStyle.italic),),
          ),
        ),
      ),
    );
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      scrollDirection: Axis.horizontal,
      key: _listKey,
      initialItemCount: _mostList.length,
      // itemCount: _mostList.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(_offset),
            child:_mostList[index]
        
        );
      }
    );
  }
}