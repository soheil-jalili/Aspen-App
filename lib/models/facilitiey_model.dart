import 'package:aspen/gen/assets.gen.dart';

class FacilitieyModel {
  String title;
  String icon;

  FacilitieyModel({required this.title, required this.icon});
}

List<FacilitieyModel> facilitiesList = [
  FacilitieyModel(title: '1 Heater', icon: Assets.images.wifi),
  FacilitieyModel(title: 'Dinner', icon: Assets.images.dinner),
  FacilitieyModel(title: '1 Tub', icon: Assets.images.bath),
  FacilitieyModel(title: 'Pool', icon: Assets.images.pool),
];
