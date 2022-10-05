class Restaurant {
  String id;
  String name;
  String description;
  String city;
  String pictureId;
  double rating;

  Restaurant({
    String? id,
    String? name,
    String? description,
    String? city,
    String? pictureId,
    double? rating,
  })  : id = id ?? '',
        name = name ?? '',
        description = description ?? '',
        city = city ?? '',
        pictureId = pictureId ?? '',
        rating = rating ?? 0.0;
}
