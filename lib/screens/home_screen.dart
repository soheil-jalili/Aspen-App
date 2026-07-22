import 'package:aspen/constants/app_colors.dart';
import 'package:aspen/gen/assets.gen.dart';
import 'package:aspen/gen/fonts.gen.dart';
import 'package:aspen/models/card_model.dart';
import 'package:aspen/screens/detail_screen.dart';
import 'package:aspen/utility/top_list_horizental.dart';
import 'package:aspen/widgets/primary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedItem = 'Aspen, USA';
  int topListIndexActive = 0;
  final Set<int> _likedIndicesPopularCard = {};
  final Set<int> _likedIndicesTopDealsCard = {};
  final FocusNode _searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.fromLTRB(20, 44, 20, 32),

              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [_topBar(), SizedBox(height: 24), _searchBar()],
                ),
              ),
            ),

            _topBarListHorizental(),
            _topTitle(title: 'Popular', haveSeeAll: true),
            _popularListView(),
            _topTitle(title: 'Recommended'),
            _recommendedListView(),
            _topTitle(title: 'Top Deals', topPadding: 22),
            _topDealsListView(),
            SliverPadding(padding: EdgeInsets.only(bottom: 100)),
          ],
        ),
      ),
    );
  }

  Widget _popularListView() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 240,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularCard.length,
          itemBuilder: (context, index) {
            final isLiked = _likedIndicesPopularCard.contains(index);
            return GestureDetector(
              onTap: () async {
                _searchFocusNode.unfocus();
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      index: index,
                      likedIndices: _likedIndicesPopularCard,
                    ),
                  ),
                );
                setState(() {});
              },
              child: PrimaryCard(
                index: index,
                isLiked: isLiked,
                onLikeTapped: () {
                  setState(() {
                    if (isLiked) {
                      _likedIndicesPopularCard.remove(index);
                    } else {
                      _likedIndicesPopularCard.add(index);
                    }
                  });
                },
                cardModel: popularCard[index],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _topDealsListView() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 240,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: topDealsCard.length,
          itemBuilder: (context, index) {
            final isLiked = _likedIndicesTopDealsCard.contains(index);
            return GestureDetector(
              onTap: () async {
                _searchFocusNode.unfocus();
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      index: index,
                      likedIndices: _likedIndicesTopDealsCard,
                    ),
                  ),
                );
                setState(() {});
              },
              child: PrimaryCard(
                index: index,
                isLiked: isLiked,
                onLikeTapped: () {
                  setState(() {
                    if (isLiked) {
                      _likedIndicesTopDealsCard.remove(index);
                    } else {
                      _likedIndicesTopDealsCard.add(index);
                    }
                  });
                },
                cardModel: topDealsCard[index],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _recommendedListView() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(left: 4, right: 4, top: 4),
              clipBehavior: Clip.hardEdge,
              width: 174,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: AppColors.recommendedGradientsColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 20,
                    spreadRadius: 0,
                    color: AppColors.recommendedShadowContainerColor,
                  ),
                ],
                border: Border.all(width: 1, color: AppColors.strokeColor),
              ),
              margin: EdgeInsets.only(
                left: index == 0 ? 20 : 0,
                right: index == 9 ? 20 : 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Assets.images.cart2.image(fit: BoxFit.cover),
                      ),

                      Positioned(
                        right: 10,
                        bottom: -10,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.recommendedContainerBoxColor,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 2, color: Colors.white),
                          ),
                          child: Text(
                            '2N/3D',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: FontFamily.montserratSemiBold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 6),
                  Text(
                    'Explore Aspen',
                    style: TextStyle(
                      fontFamily: FontFamily.circularMedium,
                      color: AppColors.titleColor,
                      fontSize: 14,
                    ),
                  ),

                  Row(
                    children: [
                      SvgPicture.asset(Assets.images.trendingUp),
                      SizedBox(width: 4),
                      Text(
                        'Hot Deal',
                        style: TextStyle(
                          fontFamily: FontFamily.circularxxRegular,
                          color: AppColors.descriptionColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 4),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _topTitle({
    required String title,
    bool haveSeeAll = false,
    double topPadding = 32,
  }) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(20, topPadding, 20, 12),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.titleColor,
                    fontSize: 18,
                    fontFamily: FontFamily.montserratSemiBold,
                  ),
                ),
                haveSeeAll
                    ? GestureDetector(
                        onTap: () {},
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 12,
                            fontFamily: FontFamily.circularMedium,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _topBarListHorizental() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 41,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: topListHorizentalItem().length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => setState(() {
              topListIndexActive = index;
            }),
            child: Container(
              padding: index == topListIndexActive
                  ? EdgeInsets.symmetric(horizontal: 16, vertical: 0)
                  : null,
              decoration: topListIndexActive == index
                  ? BoxDecoration(
                      color: AppColors.topBarActiveItem,
                      borderRadius: BorderRadius.circular(33),
                    )
                  : null,
              margin: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 28),
              child: Center(
                child: Text(
                  topListHorizentalItem()[index].title,
                  style: TextStyle(
                    fontFamily: index == topListIndexActive
                        ? FontFamily.circularxxBold
                        : FontFamily.circularMedium,
                    color: index == topListIndexActive
                        ? AppColors.primaryColor
                        : AppColors.subTextColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _searchBar() {
    return Container(
      width: double.infinity,
      height: 68,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.searchFillColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.images.search),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              focusNode: _searchFocusNode,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintMaxLines: 1,
                hintText: 'Find things to do',
                hintStyle: TextStyle(
                  fontFamily: FontFamily.circularxxBook,
                  fontSize: 13,
                  color: AppColors.hintTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore',
              style: TextStyle(
                fontFamily: FontFamily.montserratRegular,
                fontSize: 14,
                color: AppColors.blackColor,
              ),
            ),
            Text(
              'Aspen',
              style: TextStyle(
                fontFamily: FontFamily.montserratMedium,
                fontSize: 32,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Assets.images.location),

            const SizedBox(width: 6),

            PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              offset: const Offset(0, 30),
              color: Colors.white,
              onSelected: (String newValue) {
                setState(() {
                  selectedItem = newValue;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Aspen, USA',
                  child: Text(
                    'Aspen, USA',
                    style: TextStyle(
                      color: AppColors.dropDownTextItemColor,
                      fontSize: 12,
                      fontFamily: FontFamily.montserratRegular,
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Aspen, France',
                  child: Text(
                    'Aspen, France',
                    style: TextStyle(
                      color: AppColors.dropDownTextItemColor,
                      fontSize: 12,
                      fontFamily: FontFamily.montserratRegular,
                    ),
                  ),
                ),
              ],
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedItem,
                    style: TextStyle(
                      color: AppColors.dropDownTextItemColor,
                      fontSize: 12,
                      fontFamily: FontFamily.montserratRegular,
                    ),
                  ),
                  const SizedBox(width: 6),
                  SvgPicture.asset(Assets.images.arrowDown),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
