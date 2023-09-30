import 'package:flutter/material.dart';
import 'package:news/api/model/sources_response/Source.dart';

class TabItem extends StatelessWidget {
  bool selected;
  Source? source;

  TabItem(this.selected, this.source);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: selected ? Theme.of(context).primaryColor : Colors.transparent,
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      ),
      child: Text(
        source?.name ?? "",
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: selected ? Colors.white : Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
