import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
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

              },
              child: Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children: [
                  Text('English',
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
}
