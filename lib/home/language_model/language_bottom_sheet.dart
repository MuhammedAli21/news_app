import 'package:flutter/material.dart';
import 'package:news_app/providers/language_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeLanguage('en');
            },
            child: Text('English',
            style: Theme.of(context).textTheme.titleLarge,),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              provider.changeLanguage('ar');
            },
            child: Text('Arabic',
              style: Theme.of(context).textTheme.titleLarge,),
          ),
        ],
      ),
    );
  }
}
