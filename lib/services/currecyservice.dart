import 'dart:convert';

import 'package:sum_swap_uz/models/currency.dart';

import 'package:http/http.dart' as http;

class Currecyservice {
  Future<List<Currency>> getCurrency() async {
    try {
      Uri url = Uri.parse('https://nbu.uz/uz/exchange-rates/json/');
      final responce = await http.get(url);
      final data = jsonDecode(responce.body);
      if (responce.statusCode == 200) {
        List<Currency> curencies =
            (data as List?)?.map((item) => Currency.fromJson(item)).toList() ??
                [];

        return curencies;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
