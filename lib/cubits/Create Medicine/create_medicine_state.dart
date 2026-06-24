part of 'create_medicine_cubit.dart';

@immutable
sealed class CreateMedicineState {}

final class CreateMedicineInitial extends CreateMedicineState {}
final class CreateMedicineFailure extends CreateMedicineState{
  final String errMessage;

  CreateMedicineFailure({required this.errMessage});
}