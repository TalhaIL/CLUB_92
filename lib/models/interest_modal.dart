import 'package:get/get.dart';

class InterestModal {
  final String name;
  final List<SubCategoryModal> subCategories;

  InterestModal({required this.name, required this.subCategories});
}

class SubCategoryModal {
  final String categoryName;
  Rx<bool> isSelected;
  SubCategoryModal({
    required this.categoryName,
    bool isSelected = false,
  }) : isSelected = isSelected.obs;
}
