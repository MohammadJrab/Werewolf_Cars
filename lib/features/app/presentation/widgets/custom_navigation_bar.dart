import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/nav_bar_item.dart';
import 'package:werewolf_cars/generated/assets.dart';

class CustomNavigationBar extends StatefulWidget {
  final StatefulNavigationShell child;

  const CustomNavigationBar({super.key, required this.child});

  @override
  // ignore: library_private_types_in_public_api
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 1),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateCursor(int index) {
    setState(() {
      selectedIndex = index;
    });
    _controller.reset();
    _controller.forward();
    widget.child.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: HWEdgeInsets.symmetric(horizontal: 8, vertical: 14),
      height: 70.h,
      width: 413.w,
      decoration: BoxDecoration(
        color: AppColors.blackLight,
        borderRadius: BorderRadius.circular(8).r,
        boxShadow: const [
          BoxShadow(
            color: Color(0x3E75AB2B),
            offset: Offset(0, 6),
            blurRadius: 17.8,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavBarItem(
            svgAsset: Assets.svgNavHome,
            isSelected: widget.child.currentIndex == 0,
            onTap: () => _animateCursor(0),
          ),
          NavBarItem(
            svgAsset: Assets.svgSearch,
            isSelected: widget.child.currentIndex == 1,
            onTap: () => _animateCursor(1),
          ),
          NavBarItem(
            svgAsset: Assets.svgNavSearch,
            isSelected: widget.child.currentIndex == 2,
            onTap: () => _animateCursor(2),
          ),
          NavBarItem(
            svgAsset: Assets.svgNavFavorite,
            isSelected: widget.child.currentIndex == 3,
            onTap: () => _animateCursor(3),
          ),
        ],
      ),
    );
  }
}
