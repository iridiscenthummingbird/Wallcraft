import 'package:flutter/material.dart';
import 'package:hw1/image-provider/background-image.dart';

class BackgroundImageProvider extends ChangeNotifier {
  List<BackgroundImage> _listOfImages = [];
  List<BackgroundImage> get listOfImages => _listOfImages;

  List<BackgroundImage> _favoriteListOfImages = [];
  List<BackgroundImage> get favoriteListOfImages => _favoriteListOfImages;

  BackgroundImageProvider() {
    for (int i = 0; i < 100; i++) {
      listOfImages.add(BackgroundImage());
    }
    for (int i = 0; i < 100; i++) {
      listOfImages[i].link =
          "https://picsum.photos/seed/${(i + 1).toString()}/540/1110";
      listOfImages[i].id = i;
    }
    //print(_favoriteListOfImages.length);
  }
  changeStateOfImage(int id) {
    BackgroundImage backgroundImage = _listOfImages[id];
    backgroundImage.changeState();
    backgroundImage.isFavorite
        ? _favoriteListOfImages.add(backgroundImage)
        : _favoriteListOfImages
            .removeWhere((element) => element.id == backgroundImage.id);
    notifyListeners();
  }

  changeStateOfFavImage(int index) {
    BackgroundImage backgroundImage = _favoriteListOfImages[index];
    backgroundImage.changeState();
    backgroundImage.isFavorite
        ? _favoriteListOfImages.add(backgroundImage)
        : _favoriteListOfImages
            .removeWhere((element) => element.id == backgroundImage.id);
    notifyListeners();
  }
}
