import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/home/news/news_widget_view_model.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:provider/provider.dart';

import '../../model/NewsRespons.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {

  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id??'');
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getNewsBySourceId(widget.source.id??'');


    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsWidgetViewModel>(
        builder:(context , viewModel , child){
          if(viewModel.errorMessage != null){
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(onPressed: (){
                  viewModel.getNewsBySourceId(widget.source.id??'');
                }, child: Text('try again'))
              ],
            );
          }
          if(viewModel.newsList == null){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }else{
            return Expanded(
              child: ListView.builder(itemBuilder: (context  , index ){
                return NewsItem(news:  viewModel.newsList![index]);
              },
                itemCount: viewModel.newsList!.length,
                controller: ScrollController(),
              ),
            );
          }
        } ,)
      /*FutureBuilder<NewsRespons?>(
          future: ApiManager.getNewsBySourceId(sourceId:widget.source.id??'' ),
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
                    ApiManager.getNewsBySourceId(sourceId: widget.source.id ?? '' );
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
                    ApiManager.getNewsBySourceId(sourceId:widget.source.id ?? '');
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
      ),*/
    );
  }
}
