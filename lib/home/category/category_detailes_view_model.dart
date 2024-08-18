import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';

class CategoryDetailesViewModel extends ChangeNotifier{

  List<Source>? sourceList;
  String? errorMessage;

  void getSources(String categoryId)async {
    sourceList = null;
    errorMessage = null;
    notifyListeners();

    try{
      var response = await ApiManager.getSources(categoryId);
    if(response?.status == 'error'){
      errorMessage = response!.message;
    }else{
      sourceList = response!.sources;
    }
  }catch(e){
      errorMessage = 'Error loading Source list';
    }
    notifyListeners();
  }
}
