class BackgroundImage {
  int id = 0;
  String? link;
  bool isFavorite = false;

  void changeState() {
    isFavorite = !isFavorite;
  }
}
