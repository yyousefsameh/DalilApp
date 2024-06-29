import 'package:dalil_app/services/cache_preferences_service.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(3, 113, 150, 1);
const kSecondryColor = Color.fromRGBO(0, 0, 0, 0.62);
const kMedicineInfoSectionColor = Color.fromRGBO(8, 76, 99, 1);
String? userEmail = CacheService.getData(key: "userEmail");
