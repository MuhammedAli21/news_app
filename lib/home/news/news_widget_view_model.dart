import 'package:flutter/material.dart';
import 'package:news_app/model/NewsRespons.dart';
import 'package:news_app/model/api_manager.dart';

class NewsWidgetViewModel extends ChangeNotifier{
  //hold data - handel logic

  List<News>? newsList;
  String? errorMessage;

  void getNewsBySourceId( sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();

    try{
      var response =  await ApiManager.getNewsBySourceId(sourceId: sourceId);
      if(response?.message == 'error'){
        errorMessage = response!.message;
      }else{
        newsList = response!.articles;
      }
    }catch(e){
      errorMessage = 'Error Loading news List';
    }
    notifyListeners();
  }

}