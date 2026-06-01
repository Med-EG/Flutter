import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_medicine_state.dart';

class CreateMedicineCubit extends Cubit<CreateMedicineState> {
  CreateMedicineCubit() : super(CreateMedicineInitial());
}
