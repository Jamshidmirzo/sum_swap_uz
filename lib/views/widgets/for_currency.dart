import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sum_swap_uz/view_model/currencyviewmodel.dart';
import 'package:sum_swap_uz/views/widgets/currencyinfo.dart';

class Bottomforcurrency extends StatefulWidget {
  const Bottomforcurrency({super.key});

  @override
  State<Bottomforcurrency> createState() => _BottomforcurrencyState();
}

class _BottomforcurrencyState extends State<Bottomforcurrency> {
  final currencyViewModel = Currencyviewmodel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: currencyViewModel.getfornotnull(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Lottie.asset('assets/lotties/loading.json',
                width: 100, height: 100),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(tr('snapshotempty')),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: snapshot.data!.length,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            final currency = snapshot.data![index];
            return Currencyinfo(
              indextopage: 0,
              currency: currency,
              index: index,
            );
          },
        );
      },
    );
  }
}
