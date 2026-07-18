import 'package:aspen/constants/app_colors.dart';
import 'package:aspen/gen/assets.gen.dart';
import 'package:aspen/gen/fonts.gen.dart';
import 'package:aspen/models/card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryCard extends StatelessWidget {
  const PrimaryCard({
    super.key,
    required this.index,
    required this.isLiked,
    required this.cardModel,
    required this.onLikeTapped,
    this.totalItems = 10,
  });

  final int index;
  final bool isLiked;
  final CardModel cardModel;
  final VoidCallback onLikeTapped;
  final int totalItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      clipBehavior: Clip.hardEdge,
      width: 188,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.red,
      ),
      margin: EdgeInsets.only(
        left: index == 0 ? 20 : 0,
        right: index == totalItems - 1 ? 20 : 28,
      ),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Image.asset(cardModel.image, fit: BoxFit.cover),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.popularContainerGradientsColors,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color:
                              AppColors.popularContainerDetailBackgroundColor,
                          borderRadius: BorderRadius.circular(59),
                        ),
                        child: Text(
                          cardModel.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: FontFamily.circularxxBook,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color:
                              AppColors.popularContainerDetailBackgroundColor,
                          borderRadius: BorderRadius.circular(59),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(Assets.images.star),
                            const SizedBox(width: 4),
                            Text(
                              cardModel.rating.toStringAsFixed(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: FontFamily.circularxxBook,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: onLikeTapped,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          isLiked
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          size: 10,
                          color: AppColors.redColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
