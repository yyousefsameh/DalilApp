import 'dart:io';
import 'package:dalil_app/constants.dart';
import 'package:dalil_app/cubits/medicine_cubit/medicine_cubit.dart';
import 'package:dalil_app/helper/get_image_from_your_camera.dart';
import 'package:dalil_app/helper/get_image_from_your_phone_gallery.dart';
import 'package:dalil_app/screens/medicine_info_screen.dart';
import 'package:dalil_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PrescriptionImageScreen extends StatefulWidget {
  const PrescriptionImageScreen({
    super.key,
  });
  static String scanPrescriptionScreenId = 'ScanPrescriptionScreen';

  @override
  State<PrescriptionImageScreen> createState() =>
      _PrescriptionImageScreenState();
}

class _PrescriptionImageScreenState extends State<PrescriptionImageScreen> {
  bool photoIsUploaded = false;
  bool photoIsTaken = false;
  XFile? phoneImage;
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    bool isScanPrescriptionChosen =
        ModalRoute.of(context)!.settings.arguments as bool;
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
            'Prescription',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: isScanPrescriptionChosen == true
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: imageFile == null
                          ? const Text(
                              "Please take a picture of your prescription",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: kSecondryColor,
                              ),
                            )
                          : Image.file(
                              imageFile!,
                              height: 350.0,
                              width: 350.0,
                            ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    const Center(
                      child: Text(
                        "Make sure that image is sharp\n"
                        " "
                        "and the Prescription is clear",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: kSecondryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    photoIsTaken == false
                        ? CustomButton(
                            buttonLabel: "Scan Prescription",
                            onTap: () async {
                              try {
                                phoneImage =
                                    await getImageFromYourPhoneCamera();
                                setState(() {
                                  imageFile = File(phoneImage!.path);
                                  photoIsTaken = true;
                                });
                              } catch (e) {
                                photoIsTaken = false;
                                // print(
                                //   e.toString(),
                                // );
                              }
                            },
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: CustomButton(
                                  buttonLabel: "Retake",
                                  onTap: () async {
                                    try {
                                      phoneImage =
                                          await getImageFromYourPhoneCamera();
                                      setState(
                                        () {
                                          imageFile = File(phoneImage!.path);
                                          photoIsTaken = true;
                                        },
                                      );
                                    } catch (e) {
                                      photoIsTaken = false;
                                      // print(e.toString());
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: CustomButton(
                                  buttonLabel: "Continue",
                                  onTap: () {
                                    BlocProvider.of<MedicineCubit>(context)
                                        .getSimilarMedicineToMedicineMahcineName(
                                      prescriptionImage: imageFile,
                                    );
                                    Navigator.pushNamed(
                                      context,
                                      MedicineInfoScreen.medicineInfoScreenId,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: imageFile == null
                          ? const Text(
                              "Please upload a picture of your prescription",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: kSecondryColor,
                              ),
                            )
                          : Image.file(
                              imageFile!,
                              height: 350.0,
                              width: 350.0,
                            ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    const Center(
                      child: Text(
                        "Make sure that image is sharp\n"
                        " "
                        "and the Prescription is clear",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: kSecondryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    photoIsUploaded == false
                        ? CustomButton(
                            buttonLabel: "Upload Prescription",
                            onTap: () async {
                              try {
                                phoneImage =
                                    await getImageFromYourPhoneGallery();
                                setState(() {
                                  imageFile = File(phoneImage!.path);
                                  photoIsUploaded = true;
                                });
                              } catch (e) {
                                photoIsUploaded = false;
                                // print(
                                //   e.toString(),
                                // );
                              }
                            },
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: CustomButton(
                                  buttonLabel: "Upload",
                                  onTap: () async {
                                    try {
                                      phoneImage =
                                          await getImageFromYourPhoneGallery();
                                      setState(
                                        () {
                                          imageFile = File(phoneImage!.path);
                                          photoIsUploaded = true;
                                        },
                                      );
                                    } catch (e) {
                                      photoIsUploaded = false;
                                      // print(e.toString());
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: CustomButton(
                                  buttonLabel: "Continue",
                                  onTap: () {
                                    BlocProvider.of<MedicineCubit>(context)
                                        .getSimilarMedicineToMedicineMahcineName(
                                      prescriptionImage: imageFile,
                                    );
                                    Navigator.pushNamed(
                                      context,
                                      MedicineInfoScreen.medicineInfoScreenId,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ));
  }
}
