import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_detailes_view_model.dart';
import 'package:news_app/model/category.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';
import '../../model/SourceResponse.dart';
import '../../model/api_manager.dart';
import '../tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}


class _CategoryDetailsState extends State<CategoryDetails> {

  CategoryDetailesViewModel viewModel = CategoryDetailesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,

      child: Consumer<CategoryDetailesViewModel>(
        builder: (context , viewModel , child){
          if(viewModel.errorMessage != null){
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(onPressed: (){
                 viewModel.getSources(widget.category.id);
                }, child: Text('try again'))
              ],
            );
          }
          if(viewModel.sourceList == null){
            return Center(
              child: CircularProgressIndicator(
                color:  AppColors.primaryColor,
              ),
            );
          }else{
            return TabWidget(sourceList: viewModel.sourceList!);
          }
        }
        ,)


     /* FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id ) ,
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
                  ApiManager.getSources(widget.category.id);
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
                  ApiManager.getSources(widget.category.id);
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
      ),*/
    );
  }
}
