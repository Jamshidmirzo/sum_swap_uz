import 'package:sum_swap_uz/models/currency.dart';
import 'package:sum_swap_uz/services/currecyservice.dart';

class Currencyviewmodel {
  List<Currency> _list = [];
  final httpservice = Currecyservice();
  Future<List<Currency>> getCurency([String title = '']) async {
    List<Currency> filterlist = [];
    _list = await httpservice.getCurrency();
    for (var i in _list) {
      if (i.title.toLowerCase().contains(title.toLowerCase())) {
        filterlist.add(i);
      }
    }
    _list = filterlist;

    return _list;
  }

  Future<List<Currency>> getfornotnull() async {
    List<Currency> notnull = [];
    _list = await httpservice.getCurrency();
    for (var element in _list) {
      if (element.nbu_cell_price.isNotEmpty) {
        notnull.add(element);
      }
    }
    return [...notnull];
  }

  Future<Currency> getDollar() async {
    Currency? dollar;

    _list = await httpservice.getCurrency();
    for (var element in _list) {
      if (element.code == 'USD') {
        dollar = element;
      }
    }
    return dollar!;
  }
}
