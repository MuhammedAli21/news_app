import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/language_model/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../providers/language_provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Language',
          style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor)
            ),
            child: InkWell(
              onTap: (){
                showLanguageBottomSheet();
              },
              child: Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appLanguage,
                  style: Theme.of(context).textTheme.titleSmall,),
                  Icon(Icons.arrow_drop_down,size: 35,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet<dynamic>(
      backgroundColor: AppColors.blackColor,
      isScrollControlled: true,
      context: context,
      builder: (context) => const Wrap(
        children: [LanguageBottomSheet()],
      ),
    );
  }
}
