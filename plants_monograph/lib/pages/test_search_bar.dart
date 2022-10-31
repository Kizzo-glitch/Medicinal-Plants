import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

static const historyLength = 5;

  List<String> _searchHistory = [
      "Cape Town",
      "Durban",
      "Pretoria Central",
    ];

  List<String> filteredSearchHistory;

  String selectedTerm;

  List<String> filteredSearchTerms ({
      @required String filter,
    }) {
      if (filter != null && filter.isEmpty) { 
        return _searchHistory.reversed
          .where((term) => term.startsWith(filter)).toList();
      } else { 
        return _searchHistory.reversed.toList();
      }
    }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchedTermFirst(term);
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filteredSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filteredSearchTerms(filter: null);
  }

  void putSearchedTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filteredSearchTerms(filter: null);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }  


// UI BUILD

FloatingSearchBar(
                controller: controller,
                body: FloatingSearchBarScrollNotifier(
                  child: SearchResultsListView(
                    searchTerm: selectedTerm,
                  )
                ),
                transition: CircularFloatingSearchBarTransition(),
                // Bouncing physics for the search history
                physics: BouncingScrollPhysics(),
                // Title is displayed on an unopened (inactive) search bar
                title: Text(
                  selectedTerm ?? 'The Search App',
                  style: Theme.of(context).textTheme.headline6,
                ),
                // Hint gets displayed once the search bar is tapped and opened
                hint: 'Search and find out...',
                actions: [
                  FloatingSearchBarAction.searchToClear(),
                ],

                onQueryChanged: (query) {
                  setState(() {
                    filteredSearchHistory = filteredSearchTerms(filter: query);
                  });
                },
                onSubmitted: (query) {
                  setState(() {
                    addSearchTerm(query);
                    selectedTerm = query;
                  });
                  controller.close();
                },
                builder: (context, transition) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Material(
                      color: Colors.white,
                      elevation: 4,
                      child: Builder(
                        builder: (context) {
                          if (filteredSearchHistory.isEmpty &&
                              controller.query.isEmpty) {
                            return Container(
                              height: 56,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                'Start searching',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            );
                          } else if (filteredSearchHistory.isEmpty) {
                              return ListTile(
                                title: Text(controller.query),
                                leading: const Icon(Icons.search),
                                onTap: () {
                                  setState(() {
                                    addSearchTerm(controller.query);
                                    selectedTerm = controller.query;
                                  });
                                  controller.close();
                                },
                              );
                          } else {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: filteredSearchHistory
                                    .map(
                                      (term) => ListTile(
                                        title: Text(
                                          term,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        leading: const Icon(Icons.history),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: () {
                                            setState(() {
                                              deleteSearchTerm(term);
                                            });
                                          },
                                        ),
                                        onTap: () {
                                          setState(() {
                                            putSearchedTermFirst(term);
                                            selectedTerm = term;
                                          });
                                          controller.close();
                                        },
                                      ),
                                    )
                                    .toList(),
                              );
                            }
                        },
                      ),
                    ),
                  );
                }
              ),


// ListView State

class SearchResultsListView extends StatelessWidget {
  
  String searchTerm;
   SearchResultsListView({
    Key key,
    @required this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // final fsb = FloatingSearchBar.of(context)!.style;

    return ListView(
      // padding: EdgeInsets.only(top: fsb.height + fsb.margins.vertical),
      children: List.generate(
        50,
        (index) => ListTile(
          title: Text('$searchTerm search result'),
          subtitle: Text(index.toString()),
        ),
      ),
    );
  }
}
  