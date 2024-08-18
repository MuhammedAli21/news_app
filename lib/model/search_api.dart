import 'package:flutter/material.dart';
import 'package:news_app/model/api_manager.dart';

import '../app_colors.dart';
import '../home/news/news_item.dart';
import 'NewsRespons.dart';

class SearchApi extends SearchDelegate{
  
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textTheme: theme.textTheme.copyWith(
          titleMedium: TextStyle(
              color: AppColors.whiteColor
          )
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.white, // Change this to your desired hint color
        ),
      ),

    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){
        query = '';
      }, icon: Icon(Icons.close,color: AppColors.whiteColor,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back,color: AppColors.whiteColor,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsRespons?>(
        future: ApiManager.searchInNews(query: query),
        builder: (context , snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Somthing went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.searchInNews(query: query);
                }, child: Text('try again'))
              ],
            );
          }
          //ERORR
          if(snapshot.data!.status! != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.searchInNews(query: query);
                }, child: Text('try again'))
              ],
            );
          }
          //Success
          var newsList = snapshot.data!.articles!;
          return Expanded(
            child: ListView.builder(itemBuilder: (context  , index ){
              return NewsItem(news: newsList[index]);
            },
              itemCount: newsList.length,
            ),
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){return Center(child: Text('Search in news'));}

    return FutureBuilder<NewsRespons?>(
        future: ApiManager.searchInNews(query: query),
        builder: (context , snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Somthing went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.searchInNews(query: query);
                }, child: Text('try again'))
              ],
            );
          }
          //ERORR
          if(snapshot.data!.status! != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.searchInNews(query: query);
                }, child: Text('try again'))
              ],
            );
          }
          //Success
          var newsList = snapshot.data!.articles!;
          return Expanded(
            child: ListView.builder(itemBuilder: (context  , index ){
              return NewsItem(news: newsList[index]);
            },
              itemCount: newsList.length,
            ),
          );
        }
    );
  }

}