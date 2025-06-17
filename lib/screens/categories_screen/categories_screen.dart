import 'package:flutter/material.dart';
import 'package:news/models/Category.dart';
import 'package:news/ui/Components/CategoryBox1.dart';

class categoriesScreen extends StatelessWidget {
  Function callback;

  categoriesScreen(this.callback);

  List<CategoryModel> categories = [
    CategoryModel(
      imagePath: "assets/images/ball.png",
      title: "Sports",
      color: Color(0xffC91C22),
      categoryid: "sports",
    ),
    CategoryModel(
      imagePath: "assets/images/Politics.png",
      title: "Politics",
      color: Color(0xff003E90),
      categoryid: "general",
    ),
    CategoryModel(
      imagePath: "assets/images/health.png",
      title: "Health",
      color: Color(0xffED1E79),
      categoryid: "health",
    ),
    CategoryModel(
      imagePath: "assets/images/bussines.png",
      title: "Business",
      color: Color(0xffCF7E48),
      categoryid: "business",
    ),
    CategoryModel(
      imagePath: "assets/images/Entertainment.png",
      title: "Entertainment",
      color: Color(0xff4882CF),
      categoryid: "entertainment",
    ),
    CategoryModel(
      imagePath: "assets/images/science.png",
      title: "Science",
      color: Color(0xffF2D352),
      categoryid: "science",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Pick your category of interest",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      callback(categories[index]);
                    },
                    child: CategoryBox(categories[index], index),
                  );
                },
                itemCount: categories.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
