import 'package:aspen/gen/assets.gen.dart';

class CardModel {
  String image;
  String title;
  double rating;
  CardModel({required this.image, required this.title, required this.rating});
}

List<CardModel> popularCard = [
  CardModel(
    image: Assets.images.home1.path,
    title: 'Alley Palace',
    rating: 4.1,
  ),
  CardModel(
    image: Assets.images.home1.path,
    title: 'Alley Palace',
    rating: 2.1,
  ),
  CardModel(
    image: Assets.images.home1.path,
    title: 'Alley Palace',
    rating: 3.1,
  ),
  CardModel(
    image: Assets.images.home1.path,
    title: 'Alley Palace',
    rating: 1.1,
  ),
  CardModel(
    image: Assets.images.home1.path,
    title: 'Alley Palace',
    rating: 3.5,
  ),
];

List<CardModel> topDealsCard = [
  CardModel(
    image: Assets.images.home2.path,
    title: 'Coeurdes Alpes',
    rating: 4.5,
  ),
  CardModel(
    image: Assets.images.home2.path,
    title: 'Coeurdes Alpes',
    rating: 3.5,
  ),
  CardModel(
    image: Assets.images.home2.path,
    title: 'Coeurdes Alpes',
    rating: 2.5,
  ),
  CardModel(
    image: Assets.images.home2.path,
    title: 'Coeurdes Alpes',
    rating: 1.5,
  ),

];
