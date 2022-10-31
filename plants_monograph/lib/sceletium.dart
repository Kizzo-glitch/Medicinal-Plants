import 'package:flutter/material.dart';
import 'sceletium_data.dart';
import 'sceletium_model.dart';

class SceletiumPage extends StatelessWidget {
  List<Sceletium> _listItem = listItem;
  // List<String> _listItem = [
  //   'assets/sceletium_1.jpg',
  //   'assets/sceletium_3.jpg',
  //  'assets/sceletium_4.jpg',
  //  'assets/sceletium_5.jpg',
  //  'assets/sceletium_6.jpg',
  //  'assets/sceletium_7.jpg',
  //  'assets/sceletium_8.jpg',
  //  'assets/sceletium_9.jpg',
  //  'assets/sceletium_10.jpg',
  //  'assets/sceletium_11.jpg',
  //  'assets/sceletium_12.jpg',
  //  'assets/sceletium_13.jpg',
  //  'assets/sceletium_14.jpg',
  //  'assets/sceletium_15.jpg',
  //  'assets/sceletium_16.jpg',
  //  'assets/sceletium_17.jpg',
  //  'assets/sceletium_18.jpg',
  //  'assets/sceletium_19.jpg',
  //  'assets/sceletium_20.jpg'
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("sceletium tortuosum", 
          style: TextStyle(fontStyle: FontStyle.italic)), 
          backgroundColor: Colors.grey[800], 
          centerTitle: true),
        // body:ListView.builder(
        //   itemCount: _listItem.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       margin: EdgeInsets.only(top: 20,),
        //       height: 620.0,
        //       decoration: BoxDecoration(
        //          border: Border.all(
        //             color: Colors.black,
        //             width: 3,
        //           ),
        //           borderRadius: BorderRadius.circular(12),
        //         image: DecorationImage(
        //           image: AssetImage(
        //             _listItem[index]
                 
        //               ),
        //           fit: BoxFit.fill,
        //         ),

        //       ),

        //     );
        //   }
        // )
        body: ListView(
          children: _listItem.map(_buildItem).toList())
    );
  }
}

Widget _buildItem(Sceletium sceletium) {
  return Container(
    // key: Key()
    margin: EdgeInsets.only(
      top: 20,
    ),
    height: 620.0,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(12),
      image: DecorationImage(
        image: AssetImage(sceletium.imageURL),
        fit: BoxFit.fill,
      ),
    ),
  );
}
