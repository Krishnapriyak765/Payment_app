// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'dart:convert';

List<CouponModel> couponModelFromJson(String str) => List<CouponModel>.from(json.decode(str).map((x) => CouponModel.fromJson(x)));

String couponModelToJson(List<CouponModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CouponModel {
    String title;
    String brand;
    String image;
    int worth;
    double price;
    DateTime expiry;
    int noOfCards;
    Status status;
    String category;

    CouponModel({
        required this.title,
        required this.brand,
        required this.image,
        required this.worth,
        required this.price,
        required this.expiry,
        required this.noOfCards,
        required this.status,
        required this.category,
    });

    factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        title: json["title"],
        brand: json["brand"],
        image: json["image"],
        worth: json["worth"],
        price: json["price"]?.toDouble(),
        expiry: DateTime.parse(json["expiry"]),
        noOfCards: json["no_of_cards"],
        status: statusValues.map[json["status"]]!,
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "brand": brand,
        "image": image,
        "worth": worth,
        "price": price,
        "expiry": "${expiry.year.toString().padLeft(4, '0')}-${expiry.month.toString().padLeft(2, '0')}-${expiry.day.toString().padLeft(2, '0')}",
        "no_of_cards": noOfCards,
        "status": statusValues.reverse[status],
        "category": category,
    };
}

enum Status {
    ACTIVE
}

final statusValues = EnumValues({
    "active": Status.ACTIVE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}


// class CouponModel {
//   String? title;
//   String? brand;
//   String? image;
//   int? worth;
//   double? price;
//   String? expiry;
//   int? noOfCards;
//   String? status;
//   String? category;

//   CouponModel(
//       {this.title,
//       this.brand,
//       this.image,
//       this.worth,
//       this.price,
//       this.expiry,
//       this.noOfCards,
//       this.status,
//       this.category});

//   CouponModel.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     brand = json['brand'];
//     image = json['image'];
//     worth = json['worth'];
//     price = json['price'];
//     expiry = json['expiry'];
//     noOfCards = json['no_of_cards'];
//     status = json['status'];
//     category = json['category'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['brand'] = this.brand;
//     data['image'] = this.image;
//     data['worth'] = this.worth;
//     data['price'] = this.price;
//     data['expiry'] = this.expiry;
//     data['no_of_cards'] = this.noOfCards;
//     data['status'] = this.status;
//     data['category'] = this.category;
//     return data;
//   }
// }
