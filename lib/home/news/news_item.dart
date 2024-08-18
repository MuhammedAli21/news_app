import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/news/new_details.dart';
import 'package:news_app/home/news/news_screen_arguments.dart';
import 'package:news_app/model/NewsRespons.dart';
import 'package:intl/intl.dart';


class NewsItem extends StatelessWidget {

  News news;
  NewsItem({required this.news});

  var inputFormat = DateFormat('dd/MM/yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       Navigator.pushNamed(context, NewDetails.routeName,
           arguments: NewsScreenArguments(news),
       );

      },
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.3,
                fit: BoxFit.fill,
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(
              news.source?.id ?? "",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.grayColor,fontSize: 16),) ,
            Text(
                news.author ?? "",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.grayColor,fontSize: 16)),
            Text(
                news.title ??'',
                style: Theme.of(context).textTheme.titleMedium),

             //todo:  fix the time format
          // Text(DateFormat('yyyy-MM-dd').format((news.publishedAt as DateTime))),

            Text(
              news.publishedAt ??'',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.grayColor,fontSize: 16),
              textAlign: TextAlign.end,),
          ],
        ),
      ),
    );
  }

}
