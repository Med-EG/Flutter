import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/helper/API.dart';
import 'package:meta/meta.dart';

part 'face_scanner_state.dart';

class FaceScannerCubit extends Cubit<FaceScannerState> {
  FaceScannerCubit() : super(FaceScannerInitial());
  ScanImage({
    required String doctorToken,
    required dynamic body,
  }) {
    try {
      emit(Loading());
      Api().post(url: 'url', body: body , token: doctorToken);
      emit(Success());
    } catch (e) {}
  }
}
