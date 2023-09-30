import 'package:flutter/material.dart';
import 'package:news/models/Category.dart';

class CategoryBox extends StatelessWidget {
  CategoryModel category;
  int index;

  CategoryBox(this.category, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Image(
              fit: BoxFit.fill,
              height: 100,
              width: 100,
              image: AssetImage(category.imagePath)),
          SizedBox(
            height: 15,
          ),
          Text(
            category.title,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: index % 2 == 0 ? Radius.circular(30) : Radius.zero,
          bottomRight: index % 2 == 0 ? Radius.zero : Radius.circular(30),
        ),
      ),
    );
  }
}
