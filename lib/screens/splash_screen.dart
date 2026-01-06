import 'package:aspen/constants/app_colors.dart';
import 'package:aspen/gen/assets.gen.dart';
import 'package:aspen/gen/fonts.gen.dart';
import 'package:aspen/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Assets.images.splash.path),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.splashGradientColors,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 93,
              child: Text(
                textAlign: TextAlign.center,
                'Aspen',
                style: TextStyle(
                  fontSize: 116,
                  fontFamily: FontFamily.hiatus,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            Positioned(
              bottom: 48,
              right: 32,
              left: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Plan your',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 24,
                      fontFamily: FontFamily.montserratRegular,
                    ),
                  ),
                  Text(
                    'Luxurious',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 40,

                      fontFamily: FontFamily.montserratMedium,
                    ),
                  ),
                  Text(
                    'Vacation',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 40,

                      fontFamily: FontFamily.montserratMedium,
                    ),
                  ),

                  SizedBox(height: 24),

                  _btnExplore(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _btnExplore(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: AppColors.btnGradientColors),
        ),
        child: Center(
          child: Text(
            'Explore',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontFamily: FontFamily.circularxxBold,
            ),
          ),
        ),
      ),
    );
  }
}
