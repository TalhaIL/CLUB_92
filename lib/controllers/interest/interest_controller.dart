import 'package:club_92/models/interest_modal.dart';
import 'package:get/get.dart';

class InterestController extends GetxController {
  final List<InterestModal> interests = [
    InterestModal(
      name: 'TECHNOLOGY',
      subCategories: [
        SubCategoryModal(categoryName: 'Product'),
        SubCategoryModal(categoryName: 'Startup'),
        SubCategoryModal(categoryName: 'Venture Capital'),
        SubCategoryModal(categoryName: 'Marketing'),
        SubCategoryModal(categoryName: 'Engineering'),
        SubCategoryModal(categoryName: 'Crypto'),
        SubCategoryModal(categoryName: 'Crypto'),
        SubCategoryModal(categoryName: 'VR/AR'),
      ],
    ),
    InterestModal(
      name: 'KNOWLEDGE',
      subCategories: [
        SubCategoryModal(categoryName: 'Maths'),
        SubCategoryModal(categoryName: 'Biology'),
        SubCategoryModal(categoryName: 'Science'),
        SubCategoryModal(categoryName: 'History'),
        SubCategoryModal(categoryName: 'Space'),
        SubCategoryModal(categoryName: 'Education'),
        SubCategoryModal(categoryName: 'Physics'),
        SubCategoryModal(categoryName: 'phychology'),
      ],
    ),
    InterestModal(
      name: 'TECHNOLOGY',
      subCategories: [
        SubCategoryModal(categoryName: 'Product'),
        SubCategoryModal(categoryName: 'Startup'),
        SubCategoryModal(categoryName: 'Venture Capital'),
        SubCategoryModal(categoryName: 'Marketing'),
        SubCategoryModal(categoryName: 'Engineering'),
        SubCategoryModal(categoryName: 'Crypto'),
        SubCategoryModal(categoryName: 'Crypto'),
        SubCategoryModal(categoryName: 'VR/AR'),
      ],
    ),
    InterestModal(
      name: 'KNOWLEDGE',
      subCategories: [
        SubCategoryModal(categoryName: 'Maths'),
        SubCategoryModal(categoryName: 'Biology'),
        SubCategoryModal(categoryName: 'Science'),
        SubCategoryModal(categoryName: 'History'),
        SubCategoryModal(categoryName: 'Space'),
        SubCategoryModal(categoryName: 'Education'),
        SubCategoryModal(categoryName: 'Physics'),
        SubCategoryModal(categoryName: 'phychology'),
      ],
    ),
  ];
}
