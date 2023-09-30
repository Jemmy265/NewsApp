import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage("assets/images/sports_image.png"),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "BBC News",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 10,
        ),
        Text("Why are football's biggest clubs starting a new tournament?",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.black)),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "3 Hours ago",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        )
      ],
    );
  }
}
