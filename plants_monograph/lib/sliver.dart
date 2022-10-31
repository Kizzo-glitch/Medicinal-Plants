import 'package:flutter/material.dart';
import 'recent_added_list.dart';
import 'most_read_list.dart';
import 'mono_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _folded = true;

  final FocusNode _textFocusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple[200],
      body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 250.0,
                floating: true,
                pinned: true,
                snap: true,

                flexibleSpace: Container(
                  // background:
                  // height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        // image: NetworkImage("https://images.unsplash.com/photo-1587212405634-18e97f37e296?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=652&q=80"),
                        image: AssetImage("assets/mono_cover_reduced.jpg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                        gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.2),
                        ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                            child: Container(
                          height: 40,
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: kElevationToShadow[20],
                          ),
                          child: Center(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MonoList()),
                                    );
                                  },
                                  child: Text(
                                    "Browse All",
                                    style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold, fontSize: 20),
                                  ))),
                        )),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
                // FlexibleSpaceBar(
                //     centerTitle: true,
                //     title: Text("Browse All",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 16.0,
                //         )),
                //     background: Image.network(
                //       "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                //       fit: BoxFit.cover,
                //     )
                //     ),
              ),
            ];
          },
          body: RefreshIndicator(
              onRefresh: () async {
                // await Future.delayed(Duration(seconds: 1));
                setState(() {});
              },
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: _folded ? 70 : 300,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                          boxShadow: kElevationToShadow[6],
                        ),
                        child: Row(children: [
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(
                              left: 16,
                            ),
                            child: !_folded
                                ? TextField(
                                    // autofocus: true,
                                    cursorColor: Colors.black,
                                    controller: _textEditingController,
                                    decoration: InputDecoration(hintText: 'Search', hintStyle: TextStyle(color: Colors.black), border: InputBorder.none),
                                    // onChanged: searchOperation
                                    onTap: () {
                                      showSearch(context: context, delegate: DataSearch());
                                    })
                                : null,
                          )),
                          AnimatedContainer(
                              duration: Duration(
                                milliseconds: 400,
                              ),
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
                                        padding: EdgeInsets.all(14),
                                        child: Icon(_folded ? Icons.search : Icons.close, color: _textEditingController.text.isNotEmpty ? Colors.black : Colors.red),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _folded = !_folded;
                                          _textEditingController.clear();
                                        });
                                      })))
                        ])),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recently Added",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(height: 180, child: RecentAddedList()),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Mostly Read",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(height: 180, child: MostReadList()),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ])
                  // Center(
                  //   child: Text("Sample Text"),
                  // ),
                  ))),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final monos = [
    'Lippia javanica',
    'Helichrysum Petiolare',
    'Sutherlandia',
    'Helichrysum Odoratissimum',
    'Sceletium tortuosum'
  ];

  final recentMonos = [
    'Sceletium tortuosum',
    'Sutherlandia',
    'Helichrysum Odoratissimum',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return null;
    // IconButton(
    //     icon: AnimatedIcon(
    //       icon: AnimatedIcons.menu_arrow,
    //       progress: transitionAnimation,
    //     ),
    //     onPressed: () {
    //       close(context, null);
    //     });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentMonos : monos.where((p) => p.toLowerCase().contains(query)).toList();

    return suggestionList.isEmpty
        ? Center(child: Text("Not Found"))
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                showResults(context);
              },
              leading: Icon(Icons.history),
              trailing: IconButton(icon: const Icon(Icons.clear), onPressed: () {}),
              title: RichText(
                  text: TextSpan(text: suggestionList[index].substring(0, query.length), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), children: [
                TextSpan(text: suggestionList[index].substring(query.length), style: TextStyle(color: Colors.grey))
              ])),
            ),
            itemCount: suggestionList.length,
          );
  }
}
