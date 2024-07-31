// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      cb_price: json['cb_price'] as String? ?? '',
      code: json['code'] as String? ?? '',
      nbu_buy_price: json['nbu_buy_price'] as String? ?? '',
      nbu_cell_price: json['nbu_cell_price'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'cb_price': instance.cb_price,
      'nbu_buy_price': instance.nbu_buy_price,
      'nbu_cell_price': instance.nbu_cell_price,
    };
