import 'package:e_ticaret/categories.dart';
import 'package:e_ticaret/home.dart';
import 'package:flutter/material.dart';

Widget bottomNavigationBar(String page, BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -2),
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10)
        ],
        color: Color(0xFFEFF5FB),
      ),
      width: double.infinity, //tüm alanı kapla demek
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround, //iconları eşit şekilde yay
        children: [
          buildNavIcon(
              icondata: Icons.home_filled,
              active: page == "home",
              widget: HomePage(),
              context: context),
          buildNavIcon(
              icondata: Icons.search,
              active: page == "search",
              widget: CategoriesPage(),
              context: context),
          buildNavIcon(
              icondata: Icons.shopping_basket,
              active: page == "cart",
              widget: HomePage(),
              context: context),
          buildNavIcon(
              icondata: Icons.person,
              active: page == "profile",
              widget: HomePage(),
              context: context),
        ],
      ),
    ),
  );
}

Widget buildNavIcon(
    {required IconData icondata,
    required bool active,
    required Widget widget,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Icon(
      icondata,
      size: active ? 25 : 18,
      color: Color(active ? 0xFF0001FC : 0xFF0A1034),
    ),
  );
}
