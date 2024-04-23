part of 'medicine_alert_cubit.dart';

@immutable
sealed class MedicineAlertState {}

final class MedicineAlertInitial extends MedicineAlertState {}

// ignore: must_be_immutable
final class ShowAllMedicineAlerts extends MedicineAlertState {

  List<MedicineAlertModel> medicines;
  ShowAllMedicineAlerts({required this.medicines});
}

final class NoAlertsToShow extends MedicineAlertState {}

final class CreateNewMedicineALert extends MedicineAlertState {}

final class CreateNewMedicineALertTime extends MedicineAlertState {}

final class DeleteMedicineAlert extends MedicineAlertState {}

final class DeleteNewMedicineALertTime extends MedicineAlertState {}

final class Loading extends MedicineAlertState {}

final class AddNewTimetextField extends MedicineAlertState {}