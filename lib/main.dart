import 'package:flutter/material.dart';
import 'package:hw1/image-provider/image-provider.dart';
import 'package:provider/provider.dart';

import 'image-provider/background-image.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => BackgroundImageProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallcraft',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Wallcraft"),
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    icon: Icon(Icons.favorite),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [
                GridView.builder(
                    key: PageStorageKey<int>(1),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.5, crossAxisCount: 2),
                    itemCount: context
                        .watch<BackgroundImageProvider>()
                        .listOfImages
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      BackgroundImage image = context
                          .watch<BackgroundImageProvider>()
                          .listOfImages[index];
                      return Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              image.link ??
                                  "https://picsum.photos/seed/error/540/1110",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            child: IconButton(
                              onPressed: () => context
                                  .read<BackgroundImageProvider>()
                                  .changeStateOfImage(index),
                              icon: Icon(
                                !image.isFavorite
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            top: 10,
                            right: 10,
                          ),
                        ],
                      );
                    }),
                GridView.builder(
                    key: PageStorageKey<int>(2),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.5, crossAxisCount: 2),
                    itemCount: context
                        .watch<BackgroundImageProvider>()
                        .favoriteListOfImages
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      BackgroundImage image = context
                          .watch<BackgroundImageProvider>()
                          .favoriteListOfImages[index];
                      return Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              image.link ??
                                  "https://picsum.photos/seed/error/540/1110",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            child: IconButton(
                              onPressed: () => context
                                  .read<BackgroundImageProvider>()
                                  .changeStateOfFavImage(index),
                              icon: Icon(
                                !image.isFavorite
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            top: 10,
                            right: 10,
                          ),
                        ],
                      );
                    }),
              ],
            )));
  }
}
