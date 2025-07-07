class PriceModel {
  double price;

  PriceModel({
    required this.price,
  });

  factory PriceModel.fromJson(json) {
    return PriceModel(
      price: json["price"],
    );
  }
}
