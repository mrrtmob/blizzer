import 'dart:convert';

import 'package:blizzer/api/query/query_product.dart';
import 'package:blizzer/models/Item.dart';
import 'package:flutter/material.dart';
import 'package:blizzer/components/product_card.dart';
import 'package:blizzer/models/ProductModel.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  List<Item?> items = [];
  @override
  void initState() {
    // TODO: implement initState
    queryItems().then((value) {
      items = value;
      print(items);
    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              queryItems().then((value) {
                items = value;
                print(items);
                setState(() {});
              });
            },
            child: Text("hello")),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // ...List.generate(
              //   demoProducts.length,
              //   (index) {
              //     if (demoProducts[index].isPopular)
              // return ProductCard(product: demoProducts[index]);

              //     return SizedBox
              //         .shrink(); // here by default width and height is 0
              //   },
              // ),
              
              items.isNotEmpty
                  ? ProductCard(
                      product: Product(
                          colors: [
                            Color(0xFFF6625E),
                            Color(0xFF836DB8),
                            Color(0xFFDECB9C),
                            Colors.white,
                          ],
                          description: items[0]!.description.toString(),
                          id: 2,
                          images: items[0]!.imageUrl,
                          price: items[0]!.price,
                          title: items[0]!.productName))
                  : CircularProgressIndicator(),
              SizedBox(width: getProportionateScreenWidth(18)),
            ],
          ),
        )
      ],
    );
  }
}

  // if (snapshot.hasData) {
  //                 print(snapshot.data);
  //                 return ListView.builder(
  //                   itemCount: demoProducts.length,
  //                   itemBuilder: (context, index) {
  //                     if (demoProducts[index].isPopular)
  //                       return ProductCard(product: demoProducts[index]);

  //                     return SizedBox
  //                         .shrink(); // here by default width and height is 0
  //                   },
  //                 );
  //               } else {
  //                 return Center(child: CircularProgressIndicator());
  //               }