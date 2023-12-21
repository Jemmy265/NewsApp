import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/news_response/NewsResponse.dart';
import 'package:news/models/Category.dart';
import 'package:news/screens/Settings/settings_screen.dart';
import 'package:news/screens/articles/articles_screen.dart';
import 'package:news/screens/categories_screen/categories_screen.dart';
import 'package:news/screens/home_news_fragment/home_news_fragment.dart';
import 'package:news/ui/Components/CategoryBox1.dart';
import 'package:news/ui/Components/News_Item.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;
  bool selectedSettings = false;
  bool isSearch = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          title: isSearch
              ? TextField(
                  controller: controller,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isSearch = false;
                          controller.clear();
                        });
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search",
                  ),
                )
              : Text(selectedSettings
                  ? "Settings"
                  : selectedCategory == null
                      ? "News App"
                      : selectedCategory!.title),
          actions: !isSearch
              ? selectedSettings
                  ? null
                  : selectedCategory == null
                      ? null
                      : [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isSearch = true;
                                });
                              },
                              icon: const Icon(
                                Icons.search_rounded,
                                size: 35,
                              ))
                        ]
              : null,
        ),
        drawer: isSearch
            ? null
            : Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          'News App!',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.view_list),
                      title: const Text('Categories '),
                      onTap: () {
                        selectedSettings = false;
                        selectedCategory = null;
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings '),
                      onTap: () {
                        selectedSettings = true;
                        Navigator.pop(context);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
        body: selectedSettings
            ? SettingsScreen()
            : selectedCategory == null
                ? categoriesScreen(selectCategory)
                : HomeNewsFragment(selectedCategory!, controller.text),
      ),
    );
  }

  selectCategory(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}

class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          iconSize: 20,
          onPressed: () {
            query = "";
          },
          icon: Icon(
            Icons.clear,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        iconSize: 20,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(q: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton(onPressed: () {}, child: Text("Try Again")),
                ],
              ),
            );
          }
          var response = snapshot.data;
          if (response?.status == "error") {
            return Center(
              child: Column(
                children: [
                  Text(response?.message ?? ""),
                  ElevatedButton(onPressed: () {}, child: Text("Try Again")),
                ],
              ),
            );
          }
          var newsList = snapshot.data?.newsList;
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemBuilder: (_, index) {
              return NewsItem(newsList![index]);
            },
            itemCount: newsList?.length ?? 0,
          );
        },
      ),
    );
    ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Suggestions"),
      ),
    );
  }
}
