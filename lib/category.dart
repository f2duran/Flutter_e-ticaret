import 'package:e_ticaret/components/bottomNavigation.dart';
import 'package:e_ticaret/productDetail.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

class CategoryPage extends StatelessWidget {
  String categorytitle;
  CategoryPage(this.categorytitle);

  //const CategoryPage({Key? key}) : super(key: key);
  final List products = [
    {"isim": "Laptop", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
    {"isim": "Mouse", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
    {"isim": "Laptop", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
    {"isim": "Laptop", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
    {"isim": "Laptop", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
    {"isim": "Laptop", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
    {"isim": "Laptop", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
    {"isim": "Laptop", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
    {"isim": "Laptop", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
    {"isim": "Laptop", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
    {"isim": "Laptop", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
    {"isim": "Laptop", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
    {"isim": "Laptop", "fotoğraf": "assets/laptop.png", "fiyat": "999"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(categorytitle, context),
                  //headder
                  SizedBox(
                    height: 32,
                  ),
                  //içerikler
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing:
                          10, //kutular arasında 10px boşluk diklemesine
                      crossAxisSpacing:
                          10, //kutular arasında 10px boşluk yanlamasına
                      children: products.map((product) {
                        return buildContent(product["isim"],
                            product["fotoğraf"], product["fiyat"], context);
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar("search", context),
          ],
        ),
      ),
    );
  }
}

Widget buildContent(String title, String photourl, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 16),
            ),
          ]),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Image.asset(
            photourl,
            height: 80,
            width: 80,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color(0xFF0A1034),
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "USD $price",
                style: TextStyle(
                    color: Color(0xFF0001FC),
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
