import 'package:dalil_app/models/category_model.dart';
import 'package:dalil_app/widgets/category_list_view.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const String categoryScreenId = 'CategoryScreen';

  @override
  Widget build(BuildContext context) {
    final CategoryModel categoryModel =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 28.0,
          ),
        ),
        title: Text(
          '${categoryModel.categoryName} Category',
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const CategoryListView(),
    );
  }
}
