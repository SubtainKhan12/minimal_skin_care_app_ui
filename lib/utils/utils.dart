import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String smallImage;
  final String mainImage;
  final String soldText;
  final String soldCount;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.title,
    required this.smallImage,
    required this.mainImage,
    required this.soldText,
    required this.soldCount,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background with title & small icon
        Container(
          height: 220,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFF434127)),
          padding: const EdgeInsets.only(top: 18, bottom: 86, left: 130, right: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0, right: 10),
                child: CustomText(text: title, fontSize: 50, color: Colors.white),
              ),
              SizedBox(width: 20),
              Image.asset(smallImage, width: 30, fit: BoxFit.cover),
            ],
          ),
        ),

        // Big product image (left side)
        Positioned(
          top: 12,
          left: -0,
          child: ClipRRect(borderRadius: BorderRadius.circular(78), child: Image.asset(mainImage, width: 230, fit: BoxFit.cover)),
        ),
        Positioned(top: 80, right: 40, child: CustomText(text: "Serum", fontSize: 50, color: Colors.white)),

        // Sold count badge
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 118,
            transform: Matrix4.translationValues(10, 55, 0),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(78)),
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomText1(text: soldText, fontSize: 15, color: const Color(0xFF414028)),
                ),
                CustomText1(text: soldCount, fontSize: 28, fontWeight: FontWeight.bold, color: const Color(0xFF414028)),
                const SizedBox(height: 44),
              ],
            ),
          ),
        ),

        // Add to cart button
        Positioned(
          bottom: 0,
          left: 27,
          child: Container(
            width: 125,
            transform: Matrix4.translationValues(0, 25, 0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
            child: CustomButton(title: "Add to cart", onTap: onAddToCart),
          ),
        ),
      ],
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.italiana(fontSize: fontSize, color: color, fontWeight: fontWeight, height: 1.0),
      textAlign: textAlign,
    );
  }
}

class CustomText1 extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const CustomText1({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.inter(fontSize: fontSize, color: color, fontWeight: fontWeight), textAlign: textAlign);
  }
}

class CustomText2 extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const CustomText2({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lexendDeca(fontSize: fontSize, color: color, fontWeight: fontWeight),
      textAlign: textAlign,
    );
  }
}

/// 🔹 Custom Circular Image
class CustomCircleImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const CustomCircleImage({super.key, required this.imageUrl, this.size = 54});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: Image.network(imageUrl, width: size, height: size, fit: BoxFit.cover),
    );
  }
}

/// 🔹 Category Button
class CategoryCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CategoryCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFF434127)),
          padding: const EdgeInsets.symmetric(vertical: 10),
          // margin: const EdgeInsets.only(right: 14),
          child: Center(child: CustomText1(text: title, fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

/// 🔹 Reusable Button
class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFF434127)),
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Center(child: CustomText1(text: title, fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}

class OverlappingNetworkAvatars extends StatelessWidget {
  final List<String> imageUrls;
  final double radius;
  final double overlapOffset;

  const OverlappingNetworkAvatars({Key? key, required this.imageUrls, this.radius = 50.0, this.overlapOffset = 30.0})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: radius * 2,
        width: 150,
        child: Stack(
          clipBehavior: Clip.none,
          children:
              imageUrls.asMap().entries.map((entry) {
                final index = entry.key;
                final url = entry.value;
                return Positioned(
                  left: index * overlapOffset,
                  child: Container(
                    width: radius * 2,
                    height: radius * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF434127).withOpacity(0.7), width: 4),
                    ),
                    child: CircleAvatar(backgroundImage: NetworkImage(url), radius: radius),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

class StarMultiplicationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Icon(Icons.star_rounded, color: Colors.orange, size: 30),
          );
        }),
      ),
    );
  }
}

// Usage example:
