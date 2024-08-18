import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

import '../../model/SourceResponse.dart';

class TabItem extends StatelessWidget {

  bool isSelected;
  Source source;
  TabItem({required this.isSelected , required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isSelected? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
          color: AppColors.primaryColor,
          width: 2,
        )
      ),
      child: Text(source.name??'',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: isSelected? AppColors.whiteColor : AppColors.primaryColor,
      ),
      ),
    );
  }
}
