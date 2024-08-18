import 'package:flutter/material.dart';
import 'package:news_app/home/news/new_details.dart';
import 'package:news_app/my_theme_data.dart';
import 'package:news_app/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'home/home_screen.dart';

void main(){

  runApp(ChangeNotifierProvider(create: (context) => LanguageProvider(),
  child:Myapp() ,
  ));
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
