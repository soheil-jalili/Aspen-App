import 'package:aspen/constants/app_colors.dart';
import 'package:aspen/gen/assets.gen.dart';
import 'package:aspen/gen/fonts.gen.dart';
import 'package:aspen/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageActive = 0;

  Widget _buildNavItem({required int index, required String iconPath}) {
    return InkWell(
      onTap: () => setState(() {
        pageActive = index;
      }),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            pageActive == index
                ? AppColors.primaryColor
                : AppColors.bottomItemIconColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: pageActive,
        children: [
          HomeScreen(),
          Center(
            child: Text(
              'Ticket',
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 24,
                fontFamily: FontFamily.circularMedium,
              ),
            ),
          ),
          Center(
            child: Text(
              'Followers',
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 24,
                fontFamily: FontFamily.circularMedium,
              ),
            ),
          ),
          Center(
            child: Text(
              'Profile',
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 24,
                fontFamily: FontFamily.circularMedium,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 72,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: const [
            BoxShadow(
              offset: Offset(15, -19),
              blurRadius: 22,
              spreadRadius: 0,
              color: AppColors.shadowBottomNavigationColor,
            ),
          ],
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 59.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(index: 0, iconPath: Assets.images.home),
              _buildNavItem(index: 1, iconPath: Assets.images.ticket),
              _buildNavItem(index: 2, iconPath: Assets.images.heart),
              _buildNavItem(index: 3, iconPath: Assets.images.profile),
            ],
          ),
        ),
      ),
    );
  }
}
