import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:provider/provider.dart';

import '../../model/NewsRespons.dart';
import '../../providers/language_provider.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {



  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return FutureBuilder<NewsRespons?>(
          future: ApiManager.getNewsBySourceId(sourceId:widget.source.id??'' , lang: provider.appLanguage ),
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
                    ApiManager.getNewsBySourceId(sourceId: widget.source.id ?? '' , lang: provider.appLanguage );
                    setState(() {

                    });
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
                    ApiManager.getNewsBySourceId(sourceId:widget.source.id ?? '' , lang: provider.appLanguage);
                    setState(() {

                    });
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
