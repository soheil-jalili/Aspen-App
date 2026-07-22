import 'dart:math' as math;
import 'package:aspen/constants/app_colors.dart';
import 'package:aspen/gen/assets.gen.dart';
import 'package:aspen/gen/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpandableDescriptionText extends StatefulWidget {
  const ExpandableDescriptionText({super.key, required this.text});
  final String text;

  @override
  State<ExpandableDescriptionText> createState() =>
      _ExpandableDescriptionTextState();
}

class _ExpandableDescriptionTextState extends State<ExpandableDescriptionText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: isExpanded ? null : 4,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontFamily: FontFamily.circularxxBook,
            color: AppColors.descriptionDetailScreenColor,
          ),
        ),
        const SizedBox(height: 9),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isExpanded ? 'Show Less' : 'Read more',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamily.circularxxBold,
                  color: AppColors.readMoreTextColor,
                ),
              ),
              const SizedBox(width: 4),
              Transform.rotate(
                angle: isExpanded ? math.pi : 0,
                child: SvgPicture.asset(Assets.images.arrowDown),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
