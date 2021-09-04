import 'package:e_ticaret/category.dart';
import 'package:e_ticaret/components/bottomNavigation.dart';
import 'package:e_ticaret/components/header.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
//Statles wiggetin içindeki tüm değişkenler final denir
  final List<String> categories = [
    "all",
    "computers",
    "accessories",
    "SmartPhones",
    "Smart Object",
    "Speakers",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header("Categories", context),
            SizedBox(
              height: 16,
            ),
            Expanded(
                child: ListView(
              children: categories
                  .map((String title) => buildCategory(title, context))
                  .toList(),
            )),
          ],
        ),
      ),
      bottomNavigationBar("search", context),
    ])));
  }
}

Widget buildCategory(String title, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CategoryPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4))
          ]),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0A1034)),
      ),
    ),
  );
}
