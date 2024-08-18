import 'package:flutter/material.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/home/tabs/tab_item.dart';
import 'package:news_app/model/SourceResponse.dart';

class TabWidget extends StatefulWidget {

  List<Source> sourceList ;

  TabWidget({required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if(widget.sourceList.isEmpty){
      return Center(child: Text('Nothing To show'));
    }
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                setState(() {
                  selectedIndex = index;
                });
              },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,

                tabs: widget.sourceList.map((source) => TabItem(
                    isSelected: selectedIndex == widget.sourceList.indexOf(source),
                    source: source)
                ).toList()),
            NewsWidget(source: widget.sourceList[selectedIndex])
          ],
        ));
  }
}
