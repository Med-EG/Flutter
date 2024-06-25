part of 'face_scanner_cubit.dart';

@immutable
sealed class FaceScannerState {}

final class FaceScannerInitial extends FaceScannerState {}

final class Loading extends FaceScannerState {}

final class Success extends FaceScannerState {}

final class Failed extends FaceScannerState {}
