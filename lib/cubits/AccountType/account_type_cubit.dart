import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'account_type_state.dart';

class AccountTypeCubit extends Cubit<AccountTypeState> {
  AccountTypeCubit() : super(AccountTypeInitial());
  //account 1= patient ,,, account 2= doctor ,,, account 3= doctor assistant
 int accountType=1;
  PatientAccountType() {
    accountType=1;
    emit(PatientAccountType());
  }

  DoctorAccountType() {
    accountType=2;
    emit(DoctorAccountType());
  }

  DoctorAssistantAccountType() {
    accountType=3;
    emit(DoctorAssistantAccountType());
  }
}
