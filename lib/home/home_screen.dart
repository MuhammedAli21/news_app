import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/Drawer/home_drawer.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/home/news/news_widget_view_model.dart';
import 'package:news_app/home/settings/setting.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/search_api.dart';

import '../model/NewsRespons.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home_Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  String? searchItem ;
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();
  Source? source;



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset('assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              IconButton(onPressed: (){
                showSearch(context: context, delegate: SearchApi());},
                  icon: Icon(Icons.search,color: AppColors.whiteColor,))
            ],
            title:Text(
              selectedSideMenuItem == HomeDrawer.settings ? 'Settings' :
              selectedCategory == null ?
              'News App' :
              selectedCategory!.id,
              style: Theme.of(context).textTheme.titleLarge,
            )
          ),
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick,),
          ),
          body:selectedSideMenuItem == HomeDrawer.settings ?
              Setting()
              :
          selectedCategory == null ?
                CategoryFragment(onCategoryClick: onCategoryClick,) :
                CategoryDetails(category: selectedCategory!,),
        )
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category newCategory){
    //todo : newCategory => user select
    selectedCategory = newCategory;
    setState(() {

    });
  }

  int selectedSideMenuItem = HomeDrawer.categories;
  void onSideMenuItemClick(int newSideMenuItem){
    selectedSideMenuItem = newSideMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
