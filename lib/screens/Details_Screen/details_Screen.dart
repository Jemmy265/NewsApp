import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/api/model/news_response/news.dart';
import 'package:news/screens/Web_View/Web_View.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "Details";

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as News;
    var date = DateTime.parse(news.publishedAt!);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/Background.jpg",
            ),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(news.title ?? ""),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? "",
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                news.author ?? "",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Text(news.title ?? "",
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
                  '${date.year} - ${date.month} - ${date.day}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  news.description ?? "",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black45,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(
                    context, WebViewScreen.routeName,
                    arguments: news),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "View Full Article",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      size: 35,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
