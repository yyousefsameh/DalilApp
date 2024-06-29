import 'package:dalil_app/models/history_model/history_model_list_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomHistoryMedicineCard extends StatelessWidget {
  const CustomHistoryMedicineCard({
    super.key,
    this.onTap,
    required this.historyModelData,
  });
  final HistoryModelListData historyModelData;
  final VoidCallback? onTap;

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
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Text(
                  historyModelData.medicine!,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              // Image.network(
              //   'https://th.bing.com/th/id/OIP.pIaPlko7bsYW2fmCZPElHgHaHa?w=179&h=180&c=7&r=0&o=5&pid=1.7',
              //   width: 110,
              //   height: 110,
              // ),
              // const Spacer(
              //   flex: 1,
              // ),
              // Column(

              //   children: [

              //     // Text(
              //     //   'Tapes',
              //     //   style: TextStyle(
              //     //     fontSize: 18.0,
              //     //     fontWeight: FontWeight.w600,
              //     //     color: Color.fromRGBO(173, 173, 173, 1),
              //     //   ),
              //     // ),
              //   ],
              // ),
              // const Spacer(
              //   flex: 5,
              // ),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.delete,
              //     size: 30.0,
              //     color: Color.fromRGBO(161, 168, 176, 1),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// child: ListTile(
//   leading: Image.network(
//     'https://th.bing.com/th/id/OIP.pIaPlko7bsYW2fmCZPElHgHaHa?w=179&h=180&c=7&r=0&o=5&pid=1.7',
//     width: 125,
//     height: 125,
//   ),
//   subtitle: const Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         'Panadol',
//         style: TextStyle(
//           fontSize: 20.0,
//           fontWeight: FontWeight.w600,
//           color: Colors.black,
//         ),
//       ),
//       Text(
//         'Tapes',
//         style: TextStyle(
//           fontSize: 18.0,
//           fontWeight: FontWeight.w600,
//           color: Color.fromRGBO(173, 173, 173, 1),
//         ),
//       ),
//     ],
//   ),
//   trailing: IconButton(
//     onPressed: () {},
//     icon: const Icon(
//       Icons.delete,
//       size: 30.0,
//       color: Color.fromRGBO(161, 168, 176, 1),
//     ),
//   ),
// ),
