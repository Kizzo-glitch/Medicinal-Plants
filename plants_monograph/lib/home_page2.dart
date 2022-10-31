import 'package:flutter/material.dart';
import 'mono_list.dart';
import 'recent_added_list.dart';
import 'most_read_list.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  // List<String> _searchHistory = [
  //   'fuchsia',
  //   'flutter',
  //   'widgets',
  //   'resocoder',
  // ];
  // The filtered & ordered history that's accessed from the UI
  // List<String> filteredSearchHistory;

  // // The currently searched-for term
  // String selectedTerm;

  // List<String> filterSearchTerms({
  //   @required String filter,
  // }) {
  //   if (filter != null && filter.isNotEmpty) {
  //     // Reversed because we want the last added items to appear first in the UI
  //     return _searchHistory.reversed.where((term) => term.startsWith(filter)).toList();
  //   } else {
  //     return _searchHistory.reversed.toList();
  //   }
  // }

  // void addSearchTerm(String term) {
  //   if (_searchHistory.contains(term)) {
  //     // This method will be implemented soon
  //     putSearchTermFirst(term);
  //     return;
  //   }
  //   _searchHistory.add(term);
  //   if (_searchHistory.length > historyLength) {
  //     _searchHistory.removeRange(0, _searchHistory.length - historyLength);
  //   }
  //   // Changes in _searchHistory mean that we have to update the filteredSearchHistory
  //   filteredSearchHistory = filterSearchTerms(filter: null);
  // }

  // void deleteSearchTerm(String term) {
  //   _searchHistory.removeWhere((t) => t == term);
  //   filteredSearchHistory = filterSearchTerms(filter: null);
  // }

  // void putSearchTermFirst(String term) {
  //   deleteSearchTerm(term);
  //   addSearchTerm(term);
  // }

  List<String> foodList = [
    'Orange',
    'Berries',
    'Lemons',
    'Apples',
    'Mangoes',
  ];

  TextEditingController _textEditingController = TextEditingController();
  List<String> foodListSearch;

  bool _folded = true;

  @override
  void dispose() {
    // _textFocusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[200],
        body: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
              setState(() {
                RecentAddedList();
              });
            },
            child: SafeArea(
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 250,
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
                              Container(
                                height: 40,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white54,
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
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: AnimatedContainer(
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
                                      ? TextField(cursorColor: Colors.black, controller: _textEditingController, decoration: InputDecoration(hintText: 'Search', hintStyle: TextStyle(color: Colors.black), border: InputBorder.none)
                                          // onChanged: (value) {
                                          //   setState(() {
                                          //     // foodListSearch = foodList
                                          //     //     .where(
                                          //     //         (element) => element.contains(value.toLowerCase()))
                                          //     //     .toList();
                                          //     // if (_textEditingController!.text.isNotEmpty &&
                                          //     //     foodListSearch!.length == 0) {
                                          //     //   print('foodListSearch length ${foodListSearch!.length}');
                                          //     // }
                                          //   });
                                          // },
                                          )
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
                                              child: Icon(_folded ? Icons.search : Icons.close, color: _textEditingController.text.isNotEmpty ? Colors.red : Colors.black),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _folded = !_folded;
                                                _textEditingController.clear();
                                              });
                                            })))
                              ]))),
                      SizedBox(
                        height: 10,
                      ),
                      // _textEditingController.text.isNotEmpty
                      //     ?
                      // Container(
                      //     height: 200,
                      //     child: ListView.builder(
                      //         itemCount: _textEditingController.text.isNotEmpty ? foodListSearch.length : foodList.length,
                      //         itemBuilder: (ctx, index) {
                      //           return Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Row(
                      //               children: [
                      //                 CircleAvatar(
                      //                   child: Icon(Icons.food_bank),
                      //                 ),
                      //                 SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 Text(_textEditingController.text.isNotEmpty ? foodListSearch[index] : foodList[index]),
                      //               ],
                      //             ),
                      //           );
                      //         })
                      //         )
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
                    ],
                  )
                  // ))],
                  ),
            )));
  }
}
