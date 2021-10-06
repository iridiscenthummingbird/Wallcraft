class BackgroundImage {
  String? link;
  bool isFavorite = false;

  void changeState() {
    isFavorite = !isFavorite;
  }
}
