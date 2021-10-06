import 'package:flutter/material.dart';
import 'package:hw1/image-provider/image-provider.dart';
import 'package:provider/provider.dart';

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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.5, crossAxisCount: 2),
                    itemCount: context
                        .watch<BackgroundImageProvider>()
                        .listOfImages
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              context
                                      .watch<BackgroundImageProvider>()
                                      .listOfImages[index]
                                      .link ??
                                  "https://picsum.photos/seed/error/540/1110",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border,
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
                Icon(Icons.favorite)
              ],
            )));
  }
}
