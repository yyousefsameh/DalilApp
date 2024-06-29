import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalil_app/models/medicine_model.dart';
import 'package:flutter/material.dart';

class CustomAToZMedicineCard extends StatelessWidget {
  const CustomAToZMedicineCard({
    super.key,
    this.onTap,
    required this.medicineModel,
  });

  final VoidCallback? onTap;

  final MedicineModel medicineModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // to make the container smaller you can put height:
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(25, 154, 142, 0.77),
          ),
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 40.0,
              color: Colors.grey.withOpacity(0.3),
              // ظبطو ال shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: medicineModel.medicineImage!,
                width: 110,
                height: 110,
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error,
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicineModel.medicineName,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Medicine's Alternatives: ${medicineModel.medicineAlternative}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(173, 173, 173, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
