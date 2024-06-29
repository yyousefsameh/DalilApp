import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalil_app/constants.dart';
import 'package:dalil_app/models/medicine_model.dart';
import 'package:dalil_app/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class MedicineInfoColumn extends StatelessWidget {
  const MedicineInfoColumn({
    super.key,
    required this.medicineModel,
    required this.medicineName,
  });
  final String medicineName;
  final MedicineModel medicineModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CachedNetworkImage(
              imageUrl: medicineModel.medicineImage!,
              height: 300,
              width: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  medicineName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const CustomDivider(),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              children: [
                Text(
                  'Uses',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                    color: kMedicineInfoSectionColor,
                  ),
                ),
              ],
            ),
            const CustomDivider(),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    medicineModel.medicineUses,
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: kSecondryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              children: [
                Text(
                  'Side Effects',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                    color: kMedicineInfoSectionColor,
                  ),
                ),
              ],
            ),
            const CustomDivider(),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    medicineModel.medincineSideEffects,
                    textDirection: TextDirection.rtl,
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: kSecondryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              children: [
                Text(
                  'Dosage',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                    color: kMedicineInfoSectionColor,
                  ),
                ),
              ],
            ),
            const CustomDivider(),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    medicineModel.medicineDosage,
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: kSecondryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              children: [
                Text(
                  'Alternatives',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                    color: kMedicineInfoSectionColor,
                  ),
                ),
              ],
            ),
            const CustomDivider(),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    medicineModel.medicineAlternative,
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: kSecondryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              children: [
                Text(
                  'Type',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                    color: kMedicineInfoSectionColor,
                  ),
                ),
              ],
            ),
            const CustomDivider(),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    medicineModel.medicineType,
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: kSecondryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              children: [
                Text(
                  'concentration',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                    color: kMedicineInfoSectionColor,
                  ),
                ),
              ],
            ),
            const CustomDivider(),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    medicineModel.medicineConcentration,
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: kSecondryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              children: [
                Text(
                  'Effective Material',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                    color: kMedicineInfoSectionColor,
                  ),
                ),
              ],
            ),
            const CustomDivider(),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    medicineModel.medicineEffectiveMaterial,
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: kSecondryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
