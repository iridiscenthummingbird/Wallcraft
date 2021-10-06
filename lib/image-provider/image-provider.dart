import 'package:flutter/material.dart';
import 'package:hw1/image-provider/background-image.dart';

class BackgroundImageProvider extends ChangeNotifier {
  List<BackgroundImage> _listOfImages = [];
  List<BackgroundImage> get listOfImages => _listOfImages;
  BackgroundImageProvider() {
    for (int i = 0; i < 100; i++) {
      listOfImages.add(BackgroundImage());
    }
    for (int i = 0; i < 100; i++) {
      listOfImages[i].link =
          "https://picsum.photos/seed/${(i + 1).toString()}/540/1110";
    }
  }
  void init() {
    notifyListeners();
  }
}
