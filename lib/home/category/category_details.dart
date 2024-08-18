import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';
import '../../model/SourceResponse.dart';
import '../../model/api_manager.dart';
import '../../providers/language_provider.dart';
import '../tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}


class _CategoryDetailsState extends State<CategoryDetails> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id ,  provider.appLanguage ) ,
        builder: (context , snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color:  AppColors.primaryColor,
              ),
            );
          }else if (snapshot.hasError){
            return Column(
              children: [
                Text('Somthing went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources(widget.category.id , provider.appLanguage);
                  setState(() {

                  });
                }, child: Text('try again'))
              ],
            );
          }
          // server (response ) = > success , error

          //error
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources(widget.category.id, provider.appLanguage);
                  setState(() {

                  });
                }, child: Text('try again'))
              ],
            );
          }
          // success
          var sourceList = snapshot.data!.sources!;
          return TabWidget(sourceList: sourceList);
        },
      );
  }
}
