import 'package:dalil_app/widgets/medicines_history_listviewseprated.dart';
import 'package:flutter/material.dart';

class MedicinesHistoryScreen extends StatelessWidget {
  const MedicinesHistoryScreen({super.key});
  static String medicinesHistoryScreenId = 'MedicinesHistoryScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 28.0,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'History',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const MedicinesHistoryListViewSeprated(),
      //  Column(

      //   children: [
      //     SizedBox(
      //       height: 20.0,
      //     ),

      //     SizedBox(
      //       height: 12.0,
      //     ),
      //   ],
      // ),
    );
  }
}
