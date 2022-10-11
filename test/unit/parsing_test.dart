import 'package:flutter_test/flutter_test.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_detail_response.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_list_response.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_search_response.dart';

void main() {
  group('Parse All Responses', () {
    group('Parse RestaurantListResponse', () {
      group('Parse RestaurantListItemResponse', () {
        var json = {
          "id": "rqdv5juczeskfw1e867",
          "name": "Melting Pot",
          "description":
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
          "pictureId": "14",
          "city": "Medan",
          "rating": 4.2
        };

        test('Should be able to parse RestaurantListItemResponse from json',
            () {
          var result = RestaurantListItemResponse.fromJson(json);
          expect(result.id, 'rqdv5juczeskfw1e867');
          expect(result.name, 'Melting Pot');
          expect(result.description,
              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...');
          expect(result.pictureId, '14');
          expect(result.city, 'Medan');
          expect(result.rating, 4.2);
        });

        test('Should be able to parse RestaurantListItemResponse to json', () {
          var result = RestaurantListItemResponse.fromJson(json).toJson();
          expect(result, json);
          expect(result['id'], 'rqdv5juczeskfw1e867');
          expect(result['name'], 'Melting Pot');
          expect(result['description'],
              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...');
          expect(result['pictureId'], '14');
          expect(result['city'], 'Medan');
          expect(result['rating'], 4.2);
        });
      });

      group('Parse RestaurantListResponse', () {
        var json = {
          "error": false,
          "message": "success",
          "count": 20,
          "restaurants": [
            {
              "id": "rqdv5juczeskfw1e867",
              "name": "Melting Pot",
              "description":
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
              "pictureId": "14",
              "city": "Medan",
              "rating": 4.2
            },
            {
              "id": "s1knt6za9kkfw1e867",
              "name": "Kafe Kita",
              "description":
                  "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
              "pictureId": "25",
              "city": "Gorontalo",
              "rating": 4
            }
          ]
        };
        test('Should be able to parse RestaurantListResponse from json', () {
          var result = RestaurantListResponse.fromJson(json);
          expect(result.error, false);
          expect(result.message, 'success');
          expect(result.count, 20);
          expect(result.restaurants?.length, 2);
        });
        test('Should be able to parse RestaurantListResponse to json', () {
          var result = RestaurantListResponse.fromJson(json).toJson();
          expect(result, json);
          expect(result['error'], false);
          expect(result['message'], 'success');
          expect(result['count'], 20);
          expect(result['restaurants']?.length, 2);
        });
      });
    });
    group('Parse RestaurantDetailResponse', () {
      group('Parse CustomerReviewResponse', () {
        var json = {
          "name": "Ahmad",
          "review": "Tidak rekomendasi untuk pelajar!",
          "date": "13 November 2019"
        };
        test('Should be able to parse CustomerReviewResponse from json', () {
          var result = CustomerReviewResponse.fromJson(json);
          expect(result.name, 'Ahmad');
          expect(result.review, 'Tidak rekomendasi untuk pelajar!');
          expect(result.date, '13 November 2019');
        });

        test('Should be able to parse CustomerReviewResponse to json', () {
          var result = CustomerReviewResponse.fromJson(json).toJson();
          expect(result, json);
          expect(result['name'], 'Ahmad');
          expect(result['review'], 'Tidak rekomendasi untuk pelajar!');
          expect(result['date'], '13 November 2019');
        });
      });
      group('Parse DrinkResponse', () {
        var json = {"name": "Es krim"};
        test('Should be able to parse DrinkResponse from json', () {
          var result = DrinkResponse.fromJson(json);
          expect(result.name, 'Es krim');
        });

        test('Should be able to parse DrinkResponse to json', () {
          var result = DrinkResponse.fromJson(json).toJson();
          expect(result, json);
          expect(result['name'], 'Es krim');
        });
      });
      group('Parse FoodResponse', () {
        var json = {"name": "Toastie salmon"};
        test('Should be able to parse FoodResponse from json', () {
          var result = FoodResponse.fromJson(json);
          expect(result.name, 'Toastie salmon');
        });

        test('Should be able to parse FoodResponse to json', () {
          var result = FoodResponse.fromJson(json).toJson();
          expect(result, json);
          expect(result['name'], 'Toastie salmon');
        });
      });
      group('Parse MenuResponse', () {
        var json = {
          "foods": [
            {"name": "Paket rosemary"},
            {"name": "Toastie salmon"}
          ],
          "drinks": [
            {"name": "Es krim"},
            {"name": "Sirup"}
          ]
        };
        test('Should be able to parse MenuResponse from json', () {
          var result = MenuResponse.fromJson(json);
          expect(result.foods?.length, 2);
          expect(result.drinks?.length, 2);
        });

        test('Should be able to parse MenuResponse to json', () {
          var result = MenuResponse.fromJson(json).toJson();
          expect(result, json);
          expect(result['foods']?.length, 2);
          expect(result['drinks']?.length, 2);
        });
      });
      group('Parse CategoryResponse', () {
        var json = {"name": "Italia"};
        test('Should be able to parse CategoryResponse from json', () {
          var result = CategoryResponse.fromJson(json);
          expect(result.name, 'Italia');
        });

        test('Should be able to parse CategoryResponse to json', () {
          var result = CategoryResponse.fromJson(json).toJson();
          expect(result, json);
          expect(result['name'], 'Italia');
        });
      });
      group('Parse RestaurantDetailItemResponse', () {
        var json = {
          "id": "rqdv5juczeskfw1e867",
          "name": "Melting Pot",
          "description":
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...",
          "city": "Medan",
          "address": "Jln. Pandeglang no 19",
          "pictureId": "14",
          "categories": [
            {"name": "Italia"},
            {"name": "Modern"}
          ],
          "menus": {
            "foods": [
              {"name": "Paket rosemary"},
              {"name": "Toastie salmon"}
            ],
            "drinks": [
              {"name": "Es krim"},
              {"name": "Sirup"}
            ]
          },
          "rating": 4.2,
          "customerReviews": [
            {
              "name": "Ahmad",
              "review": "Tidak rekomendasi untuk pelajar!",
              "date": "13 November 2019"
            }
          ]
        };
        test('Should be able to parse RestaurantDetailItemResponse from json',
            () {
          var result = RestaurantDetailItemResponse.fromJson(json);
          expect(result.id, 'rqdv5juczeskfw1e867');
          expect(result.name, 'Melting Pot');
          expect(result.description,
              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...');
          expect(result.pictureId, '14');
          expect(result.city, 'Medan');
          expect(result.rating, 4.2);
          expect(result.address, 'Jln. Pandeglang no 19');
          expect(result.categories?.length, 2);
          expect(result.menus?.drinks?.length, 2);
          expect(result.menus?.foods?.length, 2);
          expect(result.customerReviews?.length, 1);
        });

        test('Should be able to parse RestaurantDetailItemResponse to json',
            () {
          var result = RestaurantDetailItemResponse.fromJson(json).toJson();
          expect(result, json);
          expect(result['id'], 'rqdv5juczeskfw1e867');
          expect(result['name'], 'Melting Pot');
          expect(result['description'],
              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...');
          expect(result['pictureId'], '14');
          expect(result['city'], 'Medan');
          expect(result['rating'], 4.2);
          expect(result['address'], 'Jln. Pandeglang no 19');
          expect(result['categories']?.length, 2);
          expect(result['menus']?['drinks']?.length, 2);
          expect(result['menus']?['foods']?.length, 2);
          expect(result['customerReviews']?.length, 1);
        });
      });
      group('Parse RestaurantDetailResponse', () {
        var json = {
          "error": false,
          "message": "success",
          "restaurant": {
            "id": "rqdv5juczeskfw1e867",
            "name": "Melting Pot",
            "description":
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...",
            "city": "Medan",
            "address": "Jln. Pandeglang no 19",
            "pictureId": "14",
            "categories": [
              {"name": "Italia"},
              {"name": "Modern"}
            ],
            "menus": {
              "foods": [
                {"name": "Paket rosemary"},
                {"name": "Toastie salmon"}
              ],
              "drinks": [
                {"name": "Es krim"},
                {"name": "Sirup"}
              ]
            },
            "rating": 4.2,
            "customerReviews": [
              {
                "name": "Ahmad",
                "review": "Tidak rekomendasi untuk pelajar!",
                "date": "13 November 2019"
              }
            ]
          }
        };
        test('Should be able to parse RestaurantDetailResponse from json', () {
          var result = RestaurantDetailResponse.fromJson(json);
          expect(result.error, false);
          expect(result.message, 'success');
        });

        test('Should be able to parse RestaurantDetailResponse to json', () {
          var result = RestaurantDetailResponse.fromJson(json).toJson();
          expect(result, json);
          expect(result['error'], false);
          expect(result['message'], 'success');
        });
      });
    });
    group('Parse RestaurantSearchResponse', () {
      group('Parse RestaurantSearchItemResponse', () {
        var json = {
          "id": "fnfn8mytkpmkfw1e867",
          "name": "Makan mudah",
          "description":
              "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, ...",
          "pictureId": "22",
          "city": "Medan",
          "rating": 3.7
        };

        test('Should be able to parse RestaurantSearchItemResponse from json',
            () {
          var result = RestaurantSearchItemResponse.fromJson(json);
          expect(result.id, 'fnfn8mytkpmkfw1e867');
          expect(result.name, 'Makan mudah');
          expect(result.description,
              'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, ...');
          expect(result.pictureId, '22');
          expect(result.city, 'Medan');
          expect(result.rating, 3.7);
        });

        test('Should be able to parse RestaurantSearchItemResponse to json',
            () {
          var result = RestaurantSearchItemResponse.fromJson(json).toJson();
          expect(result, json);
          expect(result['id'], 'fnfn8mytkpmkfw1e867');
          expect(result['name'], 'Makan mudah');
          expect(result['description'],
              'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, ...');
          expect(result['pictureId'], '22');
          expect(result['city'], 'Medan');
          expect(result['rating'], 3.7);
        });
      });

      group('Parse RestaurantSearchResponse', () {
        var json = {
          "error": false,
          "founded": 1,
          "restaurants": [
            {
              "id": "fnfn8mytkpmkfw1e867",
              "name": "Makan mudah",
              "description":
                  "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, ...",
              "pictureId": "22",
              "city": "Medan",
              "rating": 3.7
            }
          ]
        };
        test('Should be able to parse RestaurantSearchResponse from json', () {
          var result = RestaurantSearchResponse.fromJson(json);
          expect(result.error, false);
          expect(result.founded, 1);
          expect(result.restaurants?.length, 1);
        });
        test('Should be able to parse RestaurantSearchResponse to json', () {
          var result = RestaurantSearchResponse.fromJson(json).toJson();
          expect(result, json);
          expect(result['error'], false);
          expect(result['founded'], 1);
          expect(result['restaurants']?.length, 1);
        });
      });
    });
  });
}
