import 'package:flutter/material.dart';
import 'package:news_app/home/news/new_details.dart';
import 'package:news_app/my_theme_data.dart';
import 'home/home_screen.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,

      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        NewDetails.routeName : (context) => NewDetails(),
      },
    );
  }
}
