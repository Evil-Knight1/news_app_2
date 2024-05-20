import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2/components/loading_indicator.dart';
import 'package:news_app_2/components/news_list_view.dart';
import 'package:news_app_2/models/news_model.dart';
import 'package:news_app_2/services/news_services.dart';

class NewsListViewBuilder extends StatefulWidget {
    final String? category;
  const NewsListViewBuilder({
    this.category
    ,
    super.key,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  
  var news;
  @override
  void initState() {
    super.initState();
    news = NewsServices(dio: Dio()).getTopHeadLines(category: widget.category ?? 'general');
  }
  @override 
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
        future: news,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? NewsListView(
                  newsModel: snapshot.data!,
                )
              : snapshot.hasError
                  ? const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'oops error happens while fetching data',
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    )
                  :const LoadingIndicator();
        });
  }
}

