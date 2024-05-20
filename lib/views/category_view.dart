import 'package:flutter/material.dart';
import 'package:news_app_2/components/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

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
      ),
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
          child: Center(
              child: Text(
            category,
            style: const TextStyle(fontSize: 32),
          )),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        NewsListViewBuilder(
          category: category,
        ),
      ]),
    );
  }
}
