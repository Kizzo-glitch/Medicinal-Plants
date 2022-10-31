import 'package:flutter/material.dart';
import 'mono_model.dart';
import 'mono_list_data.dart';
import 'sceletium.dart';
import 'drawer.dart';

class MonoList extends StatelessWidget {
  List<Mono> _monos = monos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("List of All Monos"), backgroundColor: Colors.grey[800], centerTitle: true, actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ]),
        drawer: NavigationDrawer(),
        body: Container(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: GridView.builder(
                // crossAxisCount: 2,
                itemCount: _monos.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    // childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    maxCrossAxisExtent: 200),
                itemBuilder: (context, index) {
                  return makeItem(_monos[index]);
                })));
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
    'Lippia javanica'
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
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return SceletiumPage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentMonos : monos.where((p) => p.toLowerCase().startsWith(query)).toList();

    return suggestionList.isEmpty
        ? Center(child: Text("No Recent History"))
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

Widget makeItem(Mono item) {
  return Builder(
      builder: (BuildContext context) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SceletiumPage()),
            );
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), image: DecorationImage(image: NetworkImage(item.image), fit: BoxFit.cover)),
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
                  item.title,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            // )
          )));
}
