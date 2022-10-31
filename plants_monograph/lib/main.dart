import 'package:flutter/material.dart';
import 'home_page2.dart';
import 'package:provider/provider.dart';
import 'animation_provider.dart';
// import 'search_test.dart';
import 'sliver.dart';
// import 'cover_page.dart';
// import 'mono_list.dart';
// import 'sceletium.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AnimationProvider()),
        // Provider(create: (context) => Branches()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          // '/': (context) => HomePage2(),
          // '/': ( context) => CoverPage(),
          // '/': ( context) => MonoList(),
          // '/search_material': (BuildContext context) => new SearchBookPage(),
          // '/': ( context) => SceletiumPage()
          // '/': (context) => HomeScreen()
          '/': (context) => HomeScreen()
        },
      ),
    ));
