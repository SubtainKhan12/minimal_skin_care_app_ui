import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skin_care/screens/detail_screen.dart';
import 'package:skin_care/screens/splash_screen.dart';
import 'package:skin_care/utils/animations/shadow_animation.dart';
import 'package:skin_care/utils/app_bar.dart';
import 'package:skin_care/utils/utils.dart';

import 'const/colors.dart';
import 'models/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black, // accent color for buttons, etc.
          secondary: Colors.grey[600],
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget { 
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = true; // AppBar & BottomNav visibility
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    // Scroll listener for hiding/showing AppBar & BottomNav
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible) setState(() => _isVisible = false);
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) setState(() => _isVisible = true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main scrollable content (constrained to Stack via Positioned.fill)
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.only(top: 110, bottom: 120),
              child: Column(
                            children: [
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        CustomText1(text: "Categories", fontSize: 20, color: primaryColor),
                                        CustomText1(text: "See All", fontSize: 16, color: primaryColor),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    // Categories Section
                                    Row(
                                      children: [
                                        CategoryCard(title: "Face wash", onTap: () {}),
                                        SizedBox(width: 6),
                                        CategoryCard(title: "Hand wash", onTap: () {}),
                                        SizedBox(width: 6),
                                        CategoryCard(title: "Serum", onTap: () {}),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    // Add to cart button
                                    ProductCard(
                                      title: "Skin Oil",
                                      smallImage: "assets/images/b.png",
                                      mainImage: "assets/images/a.png",
                                      soldText: "Sold",
                                      soldCount: "10k+",
                                      onAddToCart: () {
                                        print("Add to cart pressed");
                                      },
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      children: [
                                        OverlappingNetworkAvatars(
                                          imageUrls: [
                                            'https://randomuser.me/api/portraits/women/21.jpg',
                                            'https://randomuser.me/api/portraits/women/22.jpg',
                                            'https://randomuser.me/api/portraits/women/23.jpg',
                                          ],
                                          radius: 30.0,
                                          overlapOffset: 40.0,
                                        ),
                                        StarMultiplicationWidget(),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText1(
                                          text: "Recent Products",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                        CustomText1(text: "See All", fontSize: 16, color: primaryColor),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 250,
                                child: ListView.separated(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: recentProductList.length,
                                  separatorBuilder: (context, index) => SizedBox(width: 6),
                                  itemBuilder: (context, index) {
                                    final product = recentProductList[index];
                                    return SizedBox(
                                      width: 200,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)),
                                          );
                                        },
                                        child: AnimatedShadowCard(productName: product.label, imageUrl: product.image),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText1(
                                      text: "Face Wash",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                    CustomText1(text: "See All", fontSize: 16, color: primaryColor),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 250,
                                child: ListView.separated(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: faceWashList.length,
                                  separatorBuilder: (context, index) => SizedBox(width: 6),
                                  itemBuilder: (context, index) {
                                    final product = faceWashList[index];
                                    return SizedBox(
                                      width: 200,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)),
                                          );
                                        },
                                        child: AnimatedShadowCard(productName: product.label, imageUrl: product.image),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText1(
                                      text: "Hand Wash",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                    CustomText1(text: "See All", fontSize: 16, color: primaryColor),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 250,
                                child: ListView.separated(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: handWashList.length,
                                  separatorBuilder: (context, index) => SizedBox(width: 6),
                                  itemBuilder: (context, index) {
                                    final product = handWashList[index];
                                    return SizedBox(
                                      width: 200,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)),
                                          );
                                        },
                                        child: AnimatedShadowCard(productName: product.label, imageUrl: product.image),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
            ),
          ),
          // Animated AppBar
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child:  AnimatedSlide(
                duration: const Duration(milliseconds: 500),
                offset: _isVisible ? Offset(0, 0) : Offset(0, -1),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _isVisible ? 1 : 0,
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    color: primaryColor,
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.menu,
                              size: 30,
                              color: Colors.white,
                            ),
                            CustomText2(
                              text: "Kate Michael",
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            const CustomCircleImage(
                              imageUrl: "https://randomuser.me/api/portraits/women/21.jpg",
                              size: 40,
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                      ],
                    ),
                  ),
                ),
              ),
          
          ),

          // Animated BottomNavigationBar
          Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 500),
            offset: _isVisible ? Offset(0, 0) : Offset(0, 2),
            curve: Curves.easeInOut,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _isVisible ? 1 : 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(90),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4))
                  ],
                ),
                child: CustomBottomNavBar(
                  currentIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),),
        ],
      ),
    );
  }
}
