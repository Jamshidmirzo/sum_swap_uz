import 'package:sum_swap_uz/view_model/currencyviewmodel.dart';
import 'package:sum_swap_uz/views/widgets/currencyinfo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final currcenviewmodel = Currencyviewmodel();
  bool issearch = false;
  final titlecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        clipBehavior: Clip.none,
        actions: [
          issearch
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      issearch = !issearch;
                      titlecontroller.clear();
                    });
                  },
                  child: Text(
                    context.tr('appbarcancel'),
                    style: const TextStyle(fontSize: 18),
                  ),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      issearch = !issearch;
                    });
                  },
                  icon: const Icon(Icons.search),
                )
        ],
        title: issearch
            ? Form(
                key: formkey,
                child: TextFormField(
                  controller: titlecontroller,
                  decoration: InputDecoration(
                    labelText: context.tr('inputappbar'),
                    fillColor: Theme.of(context).colorScheme.inversePrimary,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onChanged: (value) {
                    currcenviewmodel.getCurency(titlecontroller.text);
                    setState(() {});
                  },
                ))
            : Text(
                context.tr('mainappbar'),
              ),
      ),
      body: Column(
        children: [
          Flexible(
            child: FutureBuilder(
              future: currcenviewmodel.getCurency(titlecontroller.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Lottie.asset('assets/lotties/loading.json',
                        width: 100, height: 100),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Lottie.asset('assets/lotties/error.json',
                        width: 100, height: 100),
                  );
                }
                if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(context.tr('error3')),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  padding: const EdgeInsets.all(20),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final currency = snapshot.data![index];
                    return Currencyinfo(
                      indextopage: 1,
                      currency: currency,
                      index: index,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
