import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
        image: AssetImage("assets/mono_cover.jpg"),
        fit: BoxFit.cover,
      ))),
      Container(
        decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ]
                    )
                  ),
          margin: EdgeInsets.fromLTRB(30, 420, 30, 0),
          child: Column(children: [
            GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => Payment()),
                  //       );
                },
                child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0), // shadow direction: bottom right
                          )
                        ],
                        // border: Border.all(
                        //   color: Colors.red,
                        //   style: BorderStyle.solid, width: 2),
                        color: Colors.redAccent[700],
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Icon(FontAwesomeIcons.google),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign in with google',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ])))),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => Payment()),
                  //       );
                },
                child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0), // shadow direction: bottom right
                          )
                        ],
                        // border: Border.all(
                        //   color: Colors.blue,
                        //   style: BorderStyle.solid, width: 2),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(child: Icon(FontAwesomeIcons.facebook)),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                              child: Text(
                            'Sign in with facebook',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ))
                        ]))),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => Payment()),
                  //       );
                },
                child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0), // shadow direction: bottom right
                          )
                        ],
                        // border: Border.all(
                        //   color: Colors.blue,
                        //   style: BorderStyle.solid, width: 2),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(child: Icon(FontAwesomeIcons.apple)),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                              child: Text(
                            'Sign in with with apple',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ))
                        ]))),
            SizedBox(
              height: 30,
            ),
            InkWell(
                // onTap: () {
                //   Navigator.pop(context);
                // },
                child: Row(children: [
                  Icon(Icons.arrow_back, color: Colors.white),
                  Text(
                    'Back to Main Screen',
                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  )
                ]))
          ]))
    ])));
  }
}