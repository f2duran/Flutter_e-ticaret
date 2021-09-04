import 'package:e_ticaret/categories.dart';
import 'package:e_ticaret/components/bottomNavigation.dart';
import 'package:e_ticaret/components/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
    return Scaffold(
      //scaffolt widgeti ile çalışıcağımı söylüyorum
      body: SafeArea(
        //bu widget işletim sistemlerinin interface(yukrıda saat bildrim çubuğu gibi) şeylerden uzak tutar
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal:
                    16.0), //uygulamanın geneline sağdan soldan 16 px boşluk verildi.
            child: ListView(
              children: [
                //belirlediğim alana bir container gibi alt alan veriyorum

                buildBaslik(), //başlık

                buildbanner(), //banner

                //butonlar
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildnavigation(
                          text: "categories",
                          icon: Icons.menu,
                          widget: CategoriesPage(),
                          context: context),
                      buildnavigation(
                          text: "Faviroites",
                          icon: Icons.star,
                          widget: CategoriesPage(),
                          context: context),
                      buildnavigation(
                          text: "Gifts",
                          icon: Icons.card_giftcard,
                          widget: CategoriesPage(),
                          context: context),
                      buildnavigation(
                          text: "Best slling",
                          icon: Icons.people,
                          widget: CategoriesPage(),
                          context: context)
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //sales title
                Text(
                  "Sales",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF0A1034)),
                ),
                SizedBox(
                  height: 16,
                ),
                //sales items
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildsalesItem(
                        text: "smartphones",
                        photourl: "assets/samsunga50.png",
                        discount: "-50%",
                        screenwidth: screenWith),
                    buildsalesItem(
                        text: "smartphones",
                        photourl: "assets/samsunga50.png",
                        discount: "-50%",
                        screenwidth: screenWith),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildsalesItem(
                        text: "smartphone",
                        photourl: "assets/samsunga50.png",
                        discount: "-%30",
                        screenwidth: screenWith),
                    buildsalesItem(
                        text: "smartphone",
                        photourl: "assets/samsunga50.png",
                        discount: "-%30",
                        screenwidth: screenWith)
                  ],
                )
              ],
            ),
          ),
          //Bottom navigation bar
          bottomNavigationBar("home", context),
        ]),
      ),
    );
  }
}

Widget buildBaslik() {
  return Padding(
    padding: const EdgeInsets.only(
        top:
            24.0), //home yazısına yukarıdan boşluk verdik 24px(only px cinsinden olmasını sağlıyor)
    child: Text(
      "Home", //belirlenen alanın textini veriyorum
      style: TextStyle(
          //textini verdiğim alanın text özelliklerini veriyorum
          fontSize: 32, //textin büyüklüğünü px cinsinden bildiriyorum
          color: Color(0xFF0A1034), //text in rengi
          fontWeight: FontWeight.bold), //textin kalınlığı
    ),
  );
}

Widget buildbanner() {
  return Padding(
    padding: EdgeInsets.only(top: 24),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
          color: Color(0xFF0001FC),
          borderRadius: BorderRadius.circular(
              6)), //ana sayfadaki ilk widget olan banner alanının rengi, etrafının kıvrımı ve sağdan solan alanı verildi
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bose Home Speaker",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                "USD 279",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),

          //resmin boyutu belirlenemediği için daha olmadı
          Container(
            width: 80,
            height: 80,
            child: Image.asset(
              "assets/speaker.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildnavigation(
    {required String text,
    required IconData icon,
    required Widget widget,
    required BuildContext context}) {
  // Widget widget  BuildContext context
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Column(
      //ilk eleman
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE0Ecf8)),
          child: Icon(
            icon,
            color: Color(0xFF0001FC),
            size: 18,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
              color: Color(0xFF1F53E4),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

Widget buildsalesItem(
    {required String text,
    required String photourl,
    required String discount,
    required double screenwidth}) {
  return Container(
    width: (screenwidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 21),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(discount),
        SizedBox(
          height: 22,
        ),

        Center(
            child: Image.asset(
          photourl,
          height: 180,
          width: 180,
          fit: BoxFit.cover,
        )),
        SizedBox(
          height: 22,
        ),
        Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Color(0xFF0A1034)),
          ),
        )

        //ismi
      ],
    ),
  );
}
