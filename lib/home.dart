import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/colors.dart';
import 'package:fruity/model.dart';
import 'package:fruity/product_items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    "images/banners/Slider1.png",
    "images/banners/Slider2.png",
    "images/banners/Slider3.png",
  ];

  List<CategoryModel> category = [
    CategoryModel(name: 'Fruits', img: "images/category/fruits.png"),
    CategoryModel(name: 'Milk & Egg', img: "images/category/milk.png"),
    CategoryModel(name: 'Bavergas', img: "images/category/food.png"),
    CategoryModel(name: 'Clothes', img: "images/category/clothes.png"),
    CategoryModel(
      name: 'Things in Cart',
      img: "images/category/things-in-cart.png",
    ),
  ];

  List<ProductModel> product = [
    ProductModel(
      name: "Banana",
      img: "images/fruits/banana.png",
      price: "3.99",
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Papper",
      img: "images/fruits/papper.png",
      price: "2.99",
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Orange",
      img: "images/fruits/orange.png",
      price: "1.99",
      rate: "4",
      rateCount: "287",
    ),
  ];

  List basketList = [];

  void toggleSelection(ProductModel product) {
    setState(() {
      if (basketList.contains(product)) {
        basketList.remove(product);
      } else {
        basketList.add(product);
      }
    });
  }

  bool isSelected(ProductModel product) => basketList.contains(product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset("images/icons/mottor.svg"),
            SizedBox(width: 10),
            Text("61 Hopper street..", style: TextStyle(fontSize: 19)),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_down_rounded, size: 34),
            Spacer(),
            SvgPicture.asset("images/icons/basket.svg"),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// banner
            CarouselSlider(
              items: items
                  .map(
                    (item) => ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 150,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),

            SizedBox(height: 20),

            /// category
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(category.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle,
                          ),
                          width: 70,
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(category[index].img, width: 50),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          category[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fruits",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            /// products
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: List.generate(product.length, (index) {
                    final item = product[index];
                    return ProductItem(
                      image: item.img,
                      name: item.name,
                      rate: item.rate,
                      rateCount: item.rateCount,
                      price: item.price,
                      onTap: () => toggleSelection(item),
                      icon: isSelected(item)
                          ? Icon(
                              CupertinoIcons.delete,
                              color: Colors.red.shade900,
                              size: 15,
                            )
                          : Icon(Icons.add),
                    );
                  }),
                ),
              ),
            ),

            SizedBox(height: 20),

            /// cart widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                width: double.infinity,
                height: 77,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 190,
                        child: ListView.builder(
                          itemCount: basketList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(basketList[index].img),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(width: 2, height: 40, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "View Basket",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 10),
                      Badge(
                        backgroundColor: Colors.red,
                        label: Text(
                          basketList.length.toString(),
                          style: TextStyle(fontSize: 13),
                        ),
                        largeSize: 13,
                        child: SvgPicture.asset(
                          "images/icons/basket.svg",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
