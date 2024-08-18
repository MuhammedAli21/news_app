import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/news/news_screen_arguments.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewDetails extends StatelessWidget {
  const NewDetails({super.key});

  static const String routeName = 'News_details';


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NewsScreenArguments;
    var urlString = args.news.url ?? '';
    return SafeArea(
      child: Stack(
        children:[
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
          appBar: AppBar( title: Text('News',style: Theme.of(context).textTheme.titleLarge,),),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.3,
                    fit: BoxFit.fill,
                    imageUrl: args.news.urlToImage ?? '',
                    placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Text(
                  args.news.source?.id ?? "",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.grayColor,fontSize: 16),) ,
                Text(
                    args.news.author ?? "",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.grayColor,fontSize: 16)),
                Text(
                    args.news.title ??'',
                    style: Theme.of(context).textTheme.titleMedium),

                //todo:  fix the time format
                // Text(DateFormat('yyyy-MM-dd').format((news.publishedAt as DateTime))),

                Text(
                  args.news.publishedAt ??'',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.grayColor,fontSize: 16),
                  textAlign: TextAlign.end,),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Text(
                          args.news.content ??'',
                          style: Theme.of(context).textTheme.bodyLarge),

                      SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                      InkWell(
                        onTap: (){
                          launchUrlString(args.news.url ?? '');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('View Full Article',
                              style: Theme.of(context).textTheme.bodyLarge,),
                            Icon(Icons.arrow_right)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),]
      ),
    );
  }
}
