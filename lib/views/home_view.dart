import 'package:flutter/material.dart';
import 'package:news_app_2/components/categories_list_view.dart';
import 'package:news_app_2/components/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  final Function toggleTheme;

  const HomeView({required this.toggleTheme, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              const TextSpan(
                  text: 'News', style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: 'Cloud', style: TextStyle(color: Colors.amber[400])),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              toggleTheme();
            },
          ),
        ],
      ),
      body: const CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
            child: SizedBox(height: 100, child: CategoriesListView())),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 32,
          ),
        ),
        NewsListViewBuilder(),
      ]),
    );
  }
}



/*
   Widget build(BuildContext context) {
    return _isLoading == true
        ? const SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.black12,
                  ),
                  Text(
                    'Data is Loading',
                    style: TextStyle(fontSize: 32),
                  )
                ],
              ),
            ),
          )
        : NewsListView(
            newsModel: news,
          );
  }
  */
