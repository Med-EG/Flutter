part of 'account_type_cubit.dart';

@immutable
sealed class AccountTypeState {}

final class AccountTypeInitial extends AccountTypeState {}

final class DoctorAccountType extends AccountTypeState {}

final class PatientAccountType extends AccountTypeState {}

final class DoctorAssistantAccountType extends AccountTypeState {}