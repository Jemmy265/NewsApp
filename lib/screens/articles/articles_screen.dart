import 'package:flutter/material.dart';
import 'package:news/api/model/sources_response/Source.dart';
import 'package:news/ui/Components/Article_Item.dart';
import 'package:news/ui/Components/tab_item.dart';

class ArticlesScreen extends StatefulWidget {
  List<Source>? sources = [];

  ArticlesScreen(this.sources);

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
              child: ListView.separated(
                  padding: EdgeInsets.all(8),
                  itemBuilder: (context, index) => ArticleItem(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: 5),
            )
          ],
        ),
      ),
    );
  }
}
