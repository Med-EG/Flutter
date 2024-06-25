import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med_eg/cubits/FaceScannerCubit/face_scanner_cubit.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SearchForMedicalRecordByFaceID extends StatelessWidget {
  SearchForMedicalRecordByFaceID({super.key});
  final String id = 'SearchForMedicalRecordByFaceID';
  File? selectedImage;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
    return BlocConsumer<FaceScannerCubit, FaceScannerState>(
      listener: (context, state) {
        if (state is Loading) {
          isLoading = true;
        }
        if (state is Success) {}
        if (state is Failed) {}
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Stack(
                children: [
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: Image.asset('assets/images/PNG/Frame.png')),
                  Center(
                    child: Column(
                      children: [
                       const Spacer(
                          flex: 1,
                        ),
                        Container(
                          height: 320,
                          width: 270,
                          color: Colors.transparent,
                          child: Center(
                            child: Icon(
                              Icons.camera_front,
                              size: 100,
                            ),
                          ),
                        ),
                       const Spacer(
                          flex: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: CustomButton(
                            text: 'Scan',
                            onTap: () async {
                              pickImaFromTheCamera();
                              await FaceScannerCubit().ScanImage(
                                  doctorToken: doctor!.token,
                                  body: {'image': selectedImage});
                            },
                          ),
                        ),
                       const Spacer(
                          flex: 3,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future pickImaFromTheCamera() async {
    final XFile? returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage != null) {
      selectedImage = File(returnedImage.path); // Convert XFile to File
    }
  }
}
