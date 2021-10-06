import 'package:flutter/cupertino.dart';
import 'package:hw1/provider/background-image.dart';

class ImageProvider extends ChangeNotifier {
  List<BackgroundImage> listOfImages = [];

  void init() {
    for (int i = 1; i <= 100; i++) {
      listOfImages[i].link =
          "https://picsum.photos/${i.toString()}/picsum/200/300";
    }
    notifyListeners();
  }
}
