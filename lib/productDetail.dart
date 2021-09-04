import 'package:e_ticaret/components/header.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final String producttitle;
  ProductDetailPage(this.producttitle);
  //const ProductDetailPage({ Key? key }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color selectedColor = Colors.black;
  int selectedCapacity = 256;
  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0)
  ];
  List<int> capacities = [64, 256, 512];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //ekranın aşşa doğru inmesi için bu tag içinde olması gerek
                children: [
                  //header
                  header(widget.producttitle, context),
                  SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //new etiketi
                          //label("New"),
                          // SizedBox(
                          //   height: 25,
                          // ),
                          //ürün fotosu
                          Center(
                              child: Image.asset(
                            "assets/samsunga50.png",
                            height: 200,
                            width: 200,
                          )),
                          SizedBox(
                            height: 5,
                          ),
                          //renk seçeneği
                          Text(
                            "Color",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0A1034)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: colors
                                .map((Color color) => colorOption(
                                    color: color,
                                    selected: selectedColor == color,
                                    onTap: () {
                                      setState(() {
                                        selectedColor = color;
                                      });
                                    }))
                                .toList(),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          //kapasite seçenekleri
                          Text(
                            "Capacity",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0A1034)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: capacities
                                .map((int number) => capacityOption(
                                    capacity: number,
                                    selected: selectedCapacity == number,
                                    onTap: () {
                                      setState(() {
                                        selectedCapacity = number;
                                      });
                                    }))
                                .toList(),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          //sepete ekle butonu
                          GestureDetector(
                            onTap: () {
                              print("ürün sepete eklendi");
                              print("ürünün ismi" + widget.producttitle);
                              print("ürünün rengi" +
                                  selectedColor.value.toString());
                              print("ürünün kapasitesi" +
                                  selectedCapacity.toString());
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xFF1F53E4)),
                              child: Text(
                                "Add To Cart",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // bottomNavigationBar("search", context),
          ],
        ),
      ),
    );
  }
}

Widget colorOption(
    {required Color color, required bool selected, required Function onTap}) {
  return GestureDetector(
    //onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xFF0001FC), width: selected ? 4 : 0),
        color: color,
      ),
      width: 23,
      height: 23,
    ),
  );
}

Widget capacityOption(
    {required int capacity, required bool selected, required Function onTap}) {
  return GestureDetector(
    //onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 23),
      child: Container(
        child: Text(
          "$capacity GB",
          style: TextStyle(
            color: Color(selected ? 0xFF0001FC : 0xFFA7A9BE),
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
