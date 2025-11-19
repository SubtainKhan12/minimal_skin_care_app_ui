import 'package:flutter/material.dart';

import '../utils.dart';

class AnimatedShadowCard extends StatefulWidget {
  final String imageUrl;
  final String productName;

  const AnimatedShadowCard({super.key, required this.imageUrl, required this.productName});
  @override
  _AnimatedShadowCardState createState() => _AnimatedShadowCardState();
}

class _AnimatedShadowCardState extends State<AnimatedShadowCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shadowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 3000), vsync: this);
    _shadowAnimation = Tween<double>(begin: 0.2, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shadowAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage(widget.imageUrl), fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10, left: 20),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black.withOpacity(_shadowAnimation.value),
                        Colors.black.withOpacity(_shadowAnimation.value * 0.8),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.1, 1.0],
                    ),
                  ),
                  child: CustomText1(text: widget.productName, fontSize: 20.0, color: Colors.white),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white30,
                    radius: 15,
                    child: Icon(Icons.favorite_border, size: 17, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
