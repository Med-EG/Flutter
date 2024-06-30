import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med_eg/Views/medical_record.dart';
import 'package:med_eg/cubits/FaceScannerCubit/face_scanner_cubit.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/MedicalRecordCubit/medical_record_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchForMedicalRecordByFaceID extends StatefulWidget {
  const SearchForMedicalRecordByFaceID({super.key});

  final String id = 'SearchForMedicalRecordByFaceID';

  @override
  State<SearchForMedicalRecordByFaceID> createState() =>
      _SearchForMedicalRecordByFaceIDState();
}

class _SearchForMedicalRecordByFaceIDState
    extends State<SearchForMedicalRecordByFaceID> {
  File? selectedImage;
  bool isLoading = false;
  String? resaultValue;
  @override
  Widget build(BuildContext context) {
    DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
    return BlocConsumer<FaceScannerCubit, FaceScannerState>(
      listener: (context, state) {
        if (state is Loading) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is Success) {
          setState(() {
            isLoading = false;
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Success !!"),
                content: const Text("Top al Top"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
        if (state is Failure) {
          setState(() {
            isLoading = false;
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error!"),
                content:
                    const Text("This patient has no medical record for now"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
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
                            child: Image.asset(
                              'assets/images/PNG/face-recognition.png',
                              height: 300,
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
                              await pickImageFromTheCamera();
                              if (selectedImage != null) {
                                final Directory appDirectory =
                                    await getApplicationDocumentsDirectory();
                                final Directory uploadsDirectory =
                                    Directory('${appDirectory.path}/uploads');

                                if (!await uploadsDirectory.exists()) {
                                  await uploadsDirectory.create(
                                      recursive: true);
                                }

                                final String fileName =
                                    path.basename(selectedImage!.path);
                                final String savedImagePath =
                                    path.join(uploadsDirectory.path, fileName);

                                final File savedImage =
                                    await selectedImage!.copy(savedImagePath);

                                setState(() {
                                  selectedImage = savedImage;
                                });
                                setState(() {
                                  isLoading = true;
                                });

                                try {
                                  final result = await uploadLatestImage(
                                      'http://172.30.48.210:80/recognize');
                                  // Process the result from the server
                                  // You can use the Bloc to manage the state based on the result
                                  print(result);
                                  setState(() {
                                    resaultValue = result[
                                        'name']; // Extract and store 'name' value
                                  });
                                  print(resaultValue);
                                } catch (e) {
                                  // Handle the exception
                                  print('Failed to upload image: $e');
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              } else {
                                // Handle the case where no image was selected
                                print('No image selected.');
                              }
                              ;
                              setState(() {
                                isLoading = true;
                              });

                              try {
                                final result = await uploadLatestImage(
                                    'http://172.30.48.210:80/recognize');
                                // Process the result from the server
                                // You can use the Bloc to manage the state based on the result
                                print(result);
                                setState(() {
                                  resaultValue = result[
                                      'name']; // Extract and store 'name' value
                                });
                                print(resaultValue);
                                final Response = await Api().get(
                                    url:
                                        'https://api-medeg.online/api/medEG/record/patient/$resaultValue',
                                    token: doctor!.token);
                                MedicalRecordModel? record =
                                    MedicalRecordModel.fromJson(Response);
                                BlocProvider.of<MedicalRecordCubit>(context)
                                        .patientIDGetByDoctorSearch =
                                    record.medicalId;

                                Navigator.pushNamed(
                                    context, MedicalRecord().id);
                              } catch (e) {
                                // Handle the exception
                                print('Failed to upload image: $e');
                              } finally {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                          ),
                        ),
                        //     const Spacer(
                        //       flex: 3,
                        //     ),
                        //     Padding(
                        //       padding: const EdgeInsets.symmetric(horizontal: 15),
                        //       child: CustomButton(
                        //         text: 'Upload Latest Image',
                        //         onTap: () async {
                        //           setState(() {
                        //             isLoading = true;
                        //           });

                        //           try {
                        //             final result = await uploadLatestImage('http://172.30.48.210:80/recognize');
                        //             // Process the result from the server
                        //             // You can use the Bloc to manage the state based on the result
                        //             print(result);
                        //              setState(() {
                        //   resaultValue = result['name']; // Extract and store 'name' value
                        // });
                        // print(resaultValue);

                        //           } catch (e) {
                        //             // Handle the exception
                        //             print('Failed to upload image: $e');
                        //           } finally {
                        //             setState(() {
                        //               isLoading = false;
                        //             });
                        //           }
                        //         },
                        //       ),
                        //     ),

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

  Future pickImageFromTheCamera() async {
    final XFile? returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage != null) {
      setState(() {
        selectedImage = File(returnedImage.path); // Convert XFile to File
      });
    }
  }

  Future<Map<String, dynamic>> uploadLatestImage(String url) async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final Directory uploadsDirectory =
        Directory('${appDirectory.path}/uploads');

    if (!await uploadsDirectory.exists()) {
      throw Exception('Uploads directory does not exist.');
    }

    List<FileSystemEntity> files = uploadsDirectory.listSync();
    files
        .sort((a, b) => b.statSync().modified.compareTo(a.statSync().modified));

    if (files.isEmpty) {
      throw Exception('No files found in the uploads directory.');
    }

    File latestFile = File(files.first.path);
    final Uri apiUrl = Uri.parse(url);
    final request = http.MultipartRequest('POST', apiUrl)
      ..files.add(await http.MultipartFile.fromPath('file', latestFile.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await http.Response.fromStream(response);
      return json.decode(responseData.body);
    } else {
      throw Exception('Failed to upload image');
    }
  }
}
