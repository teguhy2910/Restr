extension XStrings on String {
  String get getSmallPicture =>
      'https://restaurant-api.dicoding.dev/images/small/$this';
  String get getMediumPicture =>
      'https://restaurant-api.dicoding.dev/images/medium/$this';
  String get getLargePicture =>
      'https://restaurant-api.dicoding.dev/images/large/$this';
}
