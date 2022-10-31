import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> _listItem = [
    'https://images-prod.healthline.com/hlcmsresource/images/3347-rosemary-400x400-icon.jpg',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/natural-herb-basil-plant-in-the-garden-royalty-free-image-1573782779.jpg?crop=0.536xw:1.00xh;0.240xw,0&resize=480:*',
    'data:image/jpeg;base64,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',
    'https://post.healthline.com/wp-content/uploads/2020/08/3347-lavendar-1200x628-FACEBOOK-1200x628.jpg',
    'https://hgtvhome.sndimg.com/content/dam/images/grdn/fullset/2013/8/10/0/image-7bf6e2a60000.jpg.rend.hgtvcom.966.725.suffix/1452836110515.jpeg',
    'https://www.thespruce.com/thmb/_jbkzxCmcHg69f9efqG30pugDPA=/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/how-to-grow-basil-plants-140262406-d783394bcba84db0ba3374b41247a38d.jpg',
    'https://www.thespruce.com/thmb/YoeJJe8e_krYCfniKKyjuKSdij8=/4041x2690/filters:no_upscale():max_bytes(150000):strip_icc()/best-herbs-for-tea-4151170-05-d7209c46027c459a9bda3ff7cc8f080d.jpg',
    'https://www.daviddomoney.com/wp-content/uploads/2015/02/sage-leaves-herb.jpg'

    // 'assets/heli_odo.jpg',
    // 'assets/heli_pet.png',
    // 'assets/heli_odo.jpg',
    // 'assets/les_fru.png',
    // 'assets/heli_pet.jpg',
    // 'assets/heli_odo.jpg',
    // 'assets/les_fru.png',
    // 'assets/heli_pet.png'

  ];

  bool _folded = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[600],
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Icon(Icons.menu),
      //   title: Text("Home"),
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.all(10.0),
      //       child: Container(
      //         width: 36,
      //         height: 30,
      //         decoration: BoxDecoration(
      //           color: Colors.grey[800],
      //           borderRadius: BorderRadius.circular(10)
      //         ),
      //         child: Center(child: Icon(Icons.favorite)),
      //       ),
      //     )
      //   ],
      // ),
      body: SafeArea(
        child:  Container(
          // padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              AnimatedContainer(
                duration : Duration(milliseconds: 400),
                width: _folded ? 70: 300,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: kElevationToShadow[6],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 16, ),
                        child: !_folded ? TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.green
                            ),
                            border: InputBorder.none
                          )
                        ) : null,
                      )
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400, ),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_folded ? 32 : 0),
                            topRight: Radius.circular(32),
                            bottomLeft: Radius.circular(_folded ? 32 : 0),
                            bottomRight: Radius.circular(32),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(
                              _folded? Icons.search : Icons.close, 
                              color: Colors.black
                            ),
                            
                          ),
                        onTap: () {
                            setState ((){
                              _folded = !_folded;
                            });
                          }
                        )
                      )
                    )
                  ]
                )
              ),
              SizedBox(height: 10, ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("assets/mono_cover.jpg"),
                    // NetworkImage('https://www.daviddomoney.com/wp-content/uploads/2015/02/sage-leaves-herb.jpg'),
                    fit: BoxFit.cover
                  )
                ),
                child: Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30, ),
                        child:Text("", style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),),),
                      SizedBox(height: 10,),
                      Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: Center(child: Text("Browse All", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Mostly viewed",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.bold
              )),
              Divider(thickness: 5,),
              SizedBox(height: 5,),

              SizedBox(height: 30,),
            Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: _listItem.map((item) => Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(item),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Transform.translate(
                        offset: Offset(50, -50),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                          child: Icon(Icons.bookmark_border, size: 15,),
                        ),
                      ),
                    ),
                  )).toList(),
                )
              )
            
            ],
          ),
        
        ),
      ),
    );
  }
}


