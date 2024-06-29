import 'package:dalil_app/models/category_model.dart';
import 'package:dalil_app/widgets/home_categories_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoriesList = [
      CategoryModel(
        categoryImagePath: 'assets/images/Skin.jpg',
        categoryName: 'Skin',
      ),
      CategoryModel(
        categoryImagePath: 'assets/images/Heart.jpg',
        categoryName: 'Cardiovascular',
      ),
      CategoryModel(
        categoryImagePath: 'assets/images/Ear&Nose.jpg',
        categoryName: 'Ear and nose',
      ),
      CategoryModel(
        categoryImagePath: 'assets/images/Eye.jpg',
        categoryName: 'Eye',
      ),
      CategoryModel(
        categoryImagePath: 'assets/images/Urinary system.jpg',
        categoryName: 'Urinary system',
      ),
      CategoryModel(
        categoryImagePath: 'assets/images/Neurological.jpg',
        categoryName: 'Neurological',
      ),
      CategoryModel(
        categoryImagePath: 'assets/images/Blood.jpg',
        categoryName: 'Blood',
      ),
      CategoryModel(
        categoryImagePath: 'assets/images/Digestive system.jpg',
        categoryName: 'Digestive system',
      ),
      CategoryModel(
        categoryImagePath: 'assets/images/Respiratory.jpg',
        categoryName: 'Respiratory',
      ),
      CategoryModel(
        categoryImagePath: 'assets/images/Mental health.jpg',
        categoryName: 'Mental health',
      ),
      CategoryModel(
        categoryImagePath: 'assets/images/Muscles.jpg',
        categoryName: 'Musculoskeletal',
      ),
      CategoryModel(
        categoryImagePath: 'assets/images/Nutritional Disease.jpg',
        categoryName: 'Nutritional disease',
      ),
      CategoryModel(
        categoryImagePath: 'assets/images/Cancers.jpg',
        categoryName: 'Cancers',
      ),
    ];
    return SizedBox(
      height: 120.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => HomeCategoryListViewItem(
          categoryModel: categoriesList[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10.0,
        ),
        itemCount: categoriesList.length,
      ),
    );
  }
}
