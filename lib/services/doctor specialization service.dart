import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/doctor%20specialization%20model.dart';

class DoctorSpecifyService {
  Future<List<DoctorSpecializationModel>> fetchSpecialization() async {
    final response = await Api()
        .get(url: 'https://api-medeg.online/api/medEG/doctorSpecialization');

        List<dynamic> specializations = response['specializations'];
        return specializations.map((specialization) => DoctorSpecializationModel.fromJson(specialization)).toList();
  }
}
