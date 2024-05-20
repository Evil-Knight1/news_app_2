import 'package:flutter/material.dart';
import 'package:news_app_2/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsListView extends StatelessWidget {
  final List<NewsModel> newsModel;
  const NewsListView({
    required this.newsModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: newsModel.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          newsModel[index].imagePath ??
                              'https://c4.wallpaperflare.com/wallpaper/1020/1/213/world-of-warcraft-battle-for-azeroth-video-games-warcraft-alliance-wallpaper-preview.jpg',
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 5),
                  ),
                  ListTile(
                    title: Text(
                      newsModel[index].title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      newsModel[index].description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      onPressed: () => _launchInBrowserView(
                          Uri.parse(newsModel[index].url ?? '')),
                      icon: const Icon(
                        Icons.arrow_circle_right,
                        size: 32,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }
}
