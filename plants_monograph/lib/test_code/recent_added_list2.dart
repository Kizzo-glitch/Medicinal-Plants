import 'package:flutter/material.dart';
import 'model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';



class RecentAddedList2 extends StatefulWidget {
  @override
  _RecentAddedList2State createState() => _RecentAddedList2State();
}

class _RecentAddedList2State extends State<RecentAddedList2> {

  List<Widget> _recentList = [];
  // final GlobalKey _listKey = GlobalKey();
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ScrollController controller = ScrollController();

   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addRecentMonos();
    });

    controller.addListener(() {

      double value = controller.offset/119;
       });
  }

  void _addRecentMonos() {
    // get data from db
    List<Mono> _recents = [
       Mono(image: 
        'https://post.healthline.com/wp-content/uploads/2020/08/3347-lavendar-1200x628-FACEBOOK-1200x628.jpg', 
        title: 'Helichrysum Petiolare'),

        Mono(image: 
        'https://hgtvhome.sndimg.com/content/dam/images/grdn/fullset/2013/8/10/0/image-7bf6e2a60000.jpg.rend.hgtvcom.966.725.suffix/1452836110515.jpeg', 
        title: 'Helichrysum Odoratissimum'),

        Mono(image: 
        'https://www.thespruce.com/thmb/_jbkzxCmcHg69f9efqG30pugDPA=/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/how-to-grow-basil-plants-140262406-d783394bcba84db0ba3374b41247a38d.jpg', 
        title: 'Lippia javanica'),

        Mono(image: 
        'https://images-prod.healthline.com/hlcmsresource/images/3347-rosemary-400x400-icon.jpg', 
        title: 'Sutherlandia monograph')

    ];
    Future ft = Future((){});
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
      child:Container(
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
      )
    );
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return 
     AnimatedList(
      scrollDirection: Axis.horizontal,
      key: _listKey,
      initialItemCount: _recentList.length,
      // itemCount: _mostList.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(_offset),
            child: Opacity( 
              child: Transform(
                child:_recentList[index]
              )
            )
        
        );
    // ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   key: _listKey,
    //   itemCount: _recentList.length,
    //   itemBuilder: (context, index) {
    //     return _recentList[index];
        // Opacity( 
        //       child: Transform(
        //         child:_recentList[index]
        //       )
        //     );
      }
    );
  }
}