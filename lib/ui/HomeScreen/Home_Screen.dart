import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/models/Category.dart';
import 'package:news/screens/Settings/settings_screen.dart';
import 'package:news/screens/articles/articles_screen.dart';
import 'package:news/screens/categories_screen/categories_screen.dart';
import 'package:news/screens/home_news_fragment/home_news_fragment.dart';
import 'package:news/ui/Components/CategoryBox1.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;
  bool selectedSettings = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/Background.jpg",
            ),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedSettings
              ? "Settings"
              : selectedCategory == null
                  ? "News App"
                  : selectedCategory!.title),
          actions: selectedSettings
              ? null
              : selectedCategory == null
                  ? null
                  : [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search_rounded,
                            size: 35,
                          ))
                    ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
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
                leading: Icon(Icons.view_list),
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
                leading: Icon(Icons.settings),
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
                ? categoriesScreen(SelectCategory)
                : HomeNewsFragment(),
      ),
    );
  }

  SelectCategory(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
