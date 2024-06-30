import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/helper/API.dart';
import 'package:meta/meta.dart';

part 'face_scanner_state.dart';

class FaceScannerCubit extends Cubit<FaceScannerState> {
  FaceScannerCubit() : super(FaceScannerInitial());
  String? resaultValue;
  ScanImage() async {
    try {
      emit(Loading());
      try {
        final result = await Api()
            .uploadLatestImage(url: 'http://172.30.48.210:80/recognize');
        // Process the result from the server
        // You can use the Bloc to manage the state based on the result
        print(result);

        resaultValue = result['name']; // Extract and store 'name' value

        print(resaultValue);
      } catch (e) {
        // Handle the exception
        print('Failed to upload image: $e');
      }

      emit(Success(returendID: resaultValue!));
    } catch (e) {
      emit(Failure(returendError: e.toString()));
    }
  }
}
