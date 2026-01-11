import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreens extends StatelessWidget {
  static const routeName = "introduction screen";

  IntroductionScreens({super.key});

  final List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "Title of introduction page",
      body: "Welcome to the app! This is a description of how it works.",
      image: const Center(child: Icon(Icons.waving_hand, size: 50.0)),
    ),
    PageViewModel(
      title: "Title of introduction page",
      body: "Welcome to the app! This is a description of how it works.",
      image: const Center(child: Icon(Icons.waving_hand, size: 50.0)),
    ),
    PageViewModel(
      title: "Title of introduction page",
      body: "Welcome to the app! This is a description of how it works.",
      image: const Center(child: Icon(Icons.waving_hand, size: 50.0)),
    ),
    PageViewModel(
      title: "Title of blue page",
      body:
          "Welcome to the app! This is a description on a page with a blue background.",
      image: Center(
        child: Image.network("https://example.com/image.png", height: 175.0),
      ),
      decoration: const PageDecoration(pageColor: Colors.blue),
    ),
    PageViewModel(
      title: "Title of orange text and bold page",
      body:
          "This is a description on a page with an orange title and bold, big body.",
      image: const Center(child: Text("👋", style: TextStyle(fontSize: 100.0))),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Colors.orange),
        bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ),
    ),
    PageViewModel(
      title: "Title of custom button page",
      body: "This is a description on a page with a custom button below.",
      image: Image.asset("res/splash_images/logo.png", height: 175.0),
      footer: ElevatedButton(
        onPressed: () {
          // On button pressed
        },
        child: const Text("Let's Go!"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // return (
    //   pages: listPagesViewModel,
    //   showNextButton: false,
    //   done: const Text("Done"),
    //   onDone: () {
    //     // On button pressed
    //   },
    // );
    return IntroductionScreen(
      pages: listPagesViewModel,
      showNextButton: false,
      done: const Text("Done"),
      onDone: () {
        // On button pressed
      },
    );
  }
}
