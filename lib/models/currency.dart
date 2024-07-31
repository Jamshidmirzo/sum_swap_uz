import 'package:json_annotation/json_annotation.dart';
part 'currency.g.dart';

@JsonSerializable()
class Currency {
  String title;
  String code;
  // ignore: non_constant_identifier_names
  String cb_price;
  // ignore: non_constant_identifier_names
  String nbu_buy_price;
  // ignore: non_constant_identifier_names
  String nbu_cell_price;
  // String date;
  Currency(
      // ignore: non_constant_identifier_names
      {required this.cb_price,
      required this.code,
      // required this.date,
      // ignore: non_constant_identifier_names
      required this.nbu_buy_price,
      // ignore: non_constant_identifier_names
      required this.nbu_cell_price,
      required this.title});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return _$CurrencyFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$CurrencyToJson(this);
  }
}
