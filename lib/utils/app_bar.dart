import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin {
  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.search,
    Icons.person_outline,
    Icons.shopping_cart_outlined,
  ];

  final List<String> labels = ["Home", "Search", "Profile", "Cart"];

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _separationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _separationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void didUpdateWidget(CustomBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildNavItem(int index, bool isSelected) {
    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 14 : 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF434127) : Colors.white,
          shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: isSelected ? BorderRadius.circular(1000) : null,
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: const Color(0xFF434127).withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                  : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
          border:
              isSelected
                  ? null
                  : Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: isSelected ? _scaleAnimation.value : 1.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      icons[index],
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                      size: isSelected ? 18 : 20,
                    ),
                  ),
                  if (isSelected) ...[
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 8 * _separationAnimation.value,
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: isSelected ? 1.0 : 0.0,
                      child: Text(
                        labels[index],
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _separationAnimation,
          builder: (context, child) {
            return Stack(
              children: [
                // Background content for the liquid glass effect
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.1),
                        Colors.purple.withOpacity(0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                // LiquidGlass widget on top
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Left section (items before selected)
                      if (widget.currentIndex > 0) ...[
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF434127).withOpacity(0.2),
                                Colors.transparent,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.grey.shade100),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (int i = 0; i < widget.currentIndex; i++) ...[
                                _buildNavItem(i, false),
                                if (i < widget.currentIndex - 1)
                                  SizedBox(width: 8),
                              ],
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 10 * _separationAnimation.value,
                        ),
                      ],

                      // Selected item section
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.elasticOut,
                        transform:
                            Matrix4.identity()..scale(
                              1.0 + (0.01 * _separationAnimation.value),
                            ),
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF434127).withOpacity(0.7),
                                Colors.transparent,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(35),
                            // border: Border.all(color: const Color(0xFF434127).withOpacity(0.2), width: 2),
                          ),
                          child: _buildNavItem(widget.currentIndex, true),
                        ),
                      ),

                      // Right section (items after selected)
                      if (widget.currentIndex < icons.length - 1) ...[
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 12 * _separationAnimation.value,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF434127).withOpacity(0.2),
                                Colors.transparent,
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment.bottomCenter,
                            ),
                            // color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.grey.shade100),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (
                                int i = widget.currentIndex + 1;
                                i < icons.length;
                                i++
                              ) ...[
                                _buildNavItem(i, false),
                                if (i < icons.length - 1) SizedBox(width: 8),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
