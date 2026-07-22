import 'package:aspen/constants/app_colors.dart';
import 'package:aspen/gen/assets.gen.dart';
import 'package:aspen/gen/fonts.gen.dart';
import 'package:aspen/models/facilitiey_model.dart';
import 'package:aspen/widgets/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.index,
    this.likedIndices = const {},
  });

  final int index;
  final Set<int> likedIndices;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.scaffoldGradientColors,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Image.asset(
                                    Assets.images.home2.path,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 12,
                                    left: 12,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors
                                              .backContainerDetailScreenColor,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15,
                                            horizontal: 17.5,
                                          ),
                                          child: SvgPicture.asset(
                                            Assets.images.back,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: -25,
                              right: 14,
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  setState(() {
                                    if (widget.likedIndices.contains(
                                      widget.index,
                                    )) {
                                      widget.likedIndices.remove(widget.index);
                                    } else {
                                      widget.likedIndices.add(widget.index);
                                    }
                                  });
                                },
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: AppColors
                                        .containerHeartDetailScreenBackgroundColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 6),
                                        blurRadius: 19,
                                        color: AppColors
                                            .btnHeartContainerDetailScreenShadowColor,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    widget.likedIndices.contains(widget.index)
                                        ? CupertinoIcons.heart_fill
                                        : CupertinoIcons.heart,
                                    color: AppColors.redColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Coeurdes Alpes',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: FontFamily.montserratSemiBold,
                                    color: AppColors.titleColor,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.images.star),
                                    const SizedBox(width: 4),
                                    Text(
                                      '4.5 (355 Reviews)',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily:
                                            FontFamily.circularxxRegular,
                                        color: AppColors.rateDetailScreenColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Show map',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.circularxxBold,
                                  color: AppColors.textShowMapColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const ExpandableDescriptionText(
                          text:
                              'Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining, shopping, and exploring historic landmark architecture—are virtually endless. Nestled in the heart of the Rocky Mountains, it offers stunning natural beauty, world-class outdoor recreation, and a vibrant arts scene in every season.',
                        ),
                        const SizedBox(height: 37),
                        Text(
                          'Facilities',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: FontFamily.montserratSemiBold,
                            color: AppColors.titleColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: facilitiesList
                              .map((e) => FacilityBox(facility: e))
                              .toList(),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: FontFamily.circularMedium,
                            color: AppColors.titleColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$199',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: FontFamily.circularxxBold,
                            color: AppColors.greenColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.btnShadowDetailScreen,
                            blurRadius: 6,
                            spreadRadius: 0,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          fixedSize: const Size(223, 56),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Book Now',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: FontFamily.circularxxBold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 14.75),
                            SvgPicture.asset(Assets.images.arrowRight),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FacilityBox extends StatelessWidget {
  const FacilityBox({super.key, required this.facility});

  final FacilitieyModel facility;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77,
      height: 74,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffeff3fc),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(facility.icon),
          const SizedBox(height: 6),
          Text(
            facility.title,
            style: TextStyle(
              fontSize: 10,
              fontFamily: FontFamily.circularxxBook,
              color: AppColors.facilitiesTitleColor,
            ),
          ),
        ],
      ),
    );
  }
}
