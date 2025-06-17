import 'package:flutter/material.dart';
import 'package:news/api/model/sources_response/Source.dart';
import 'package:news/ui/Components/News_Item.dart';
import 'package:news/ui/Components/News_List.dart';
import 'package:news/ui/Components/tab_item.dart';

class ArticlesScreen extends StatefulWidget {
  List<Source>? sources = [];
  String query;

  ArticlesScreen(this.sources, this.query);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  int SelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources?.length ?? 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index) {
                SelectedIndex = index;
                setState(() {});
              },
              tabs: widget.sources
                      ?.map((source) => TabItem(
                          SelectedIndex == widget.sources?.indexOf(source),
                          source))
                      .toList() ??
                  [],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: NewsList(widget.sources![SelectedIndex], widget.query),
            )
          ],
        ),
      ),
    );
  }
}
