import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skin_care/models/product_model.dart';
import 'package:skin_care/utils/utils.dart';

class ProductDetailScreen extends StatefulWidget {
  final RecentProductModel product;

  const ProductDetailScreen({super.key, required this.product});
  @override
  ProductDetailScreenState createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFCF8F3),
                  boxShadow: [BoxShadow(color: Color(0x40000000), blurRadius: 40, offset: Offset(20, 25))],
                ),
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 533,
                        width: double.infinity,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(78)),
                              child: Image.asset(widget.product.image, fit: BoxFit.cover)
                                  .animate(delay: 100.ms)
                                  .moveY(begin: 50, end: 0, duration: 1000.ms, curve: Curves.fastOutSlowIn)
                                  .fade(duration: 1000.ms, curve: Curves.fastOutSlowIn),
                            ),
                            Positioned(
                              top: 60,
                              left: 20,
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white.withOpacity(0.3),
                                  radius: 20,
                                  child: Icon(Icons.arrow_back, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: widget.product.label, color: Color(0xFF434127), fontSize: 48),
                                CustomText1(text: "\$200", color: Color(0xFF434127), fontSize: 20),
                              ],
                            )
                            .animate(delay: 300.ms)
                            .moveY(begin: 50, end: 0, duration: 1000.ms, curve: Curves.fastOutSlowIn)
                            .fade(duration: 1000.ms, curve: Curves.fastOutSlowIn),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(78)),
                      //   margin: const EdgeInsets.only(left: 23),
                      //   width: 155,
                      //   height: 26,
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(78),
                      //     child: Image.network(
                      //           "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/4Fw69YqPPA/mk8wm4ah_expires_30_days.png",
                      //           fit: BoxFit.fill,
                      //         )
                      //         .animate(delay: 300.ms)
                      //         .moveX(begin: 50, end: 0, duration: 1000.ms, curve: Curves.fastOutSlowIn)
                      //         .fade(duration: 1000.ms, curve: Curves.fastOutSlowIn),
                      //   ),
                      // ),
                      Padding(padding: const EdgeInsets.only(left: 20.0), child: StarMultiplicationWidget()),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, left: 23, right: 23),
                        width: double.infinity,
                        child: CustomText1(
                          text:
                              "This serum helps your skin look fresh, smooth, and healthy. It has vitamin C and natural ingredients that brighten your skin and make it feel soft. It also helps reduce dark spots and fine lines. The serum is light, not sticky, and works well for all skin types. Use it every day after washing your face for the best results.",
                          color: Color(0xFF000000),
                          fontSize: 13,
                        ),
                      ),
                      Container(
                            margin: const EdgeInsets.only(bottom: 47),
                            width: double.infinity,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    print('Pressed');
                                  },
                                  child: IntrinsicHeight(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xFF434127),
                                      ),
                                      padding: const EdgeInsets.only(top: 13, bottom: 13, left: 81, right: 81),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Buy Now",
                                            style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 24, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .animate(delay: 300.ms)
                          .moveY(begin: 50, end: 0, duration: 1000.ms, curve: Curves.fastOutSlowIn)
                          .fade(duration: 800.ms, curve: Curves.fastOutSlowIn),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
