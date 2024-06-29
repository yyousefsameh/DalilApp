import 'package:dalil_app/cubits/medicine_cubit/medicine_cubit.dart';
import 'package:dalil_app/models/category_model.dart';
import 'package:dalil_app/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCategoryListViewItem extends StatelessWidget {
  const HomeCategoryListViewItem({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<MedicineCubit>(context).getMedicinesByCategory(
          medicinesCategory: categoryModel.categoryName,
        );
        Navigator.pushNamed(
          context,
          CategoryScreen.categoryScreenId,
          arguments: categoryModel,
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(35.0),
            child: Image.asset(
              categoryModel.categoryImagePath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            categoryModel.categoryName,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
