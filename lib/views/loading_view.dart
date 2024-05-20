import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2/views/home_view.dart';

class LoadingView extends StatefulWidget {
    final Function toggleTheme;

    const LoadingView({super.key, required this.toggleTheme});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView>
    with SingleTickerProviderStateMixin {
      
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) =>  HomeView(toggleTheme: widget.toggleTheme,),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xF60094F6), Color(0xFF45BDDF)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(animatedTexts: [
              TypewriterAnimatedText(
                'News',
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
              TypewriterAnimatedText(
                'Cloud',
                textStyle: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              )
              // ColorizeAnimatedText('NewsCloud',
              //     textStyle:
              //         const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              //     colors: [
              //       Colors.black,
              //       Colors.amber,
              //     ],
              //     speed: const Duration(seconds: 3 ))
            ]),
          ],
        ),
      ),
    );
  }
}
