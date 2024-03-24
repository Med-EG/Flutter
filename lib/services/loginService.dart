import 'package:http/http.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/paitentModel.dart';

class LoginService {
  final String baseURL = 'https://api-medeg.online/medEG';

  Future<PatientInfo> paitent(
      {required String email, required String password}) async {
    Response response = await Api().post(
        url: '$baseURL/patient/login',
        body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      PatientInfo paitent = PatientInfo.fromJson(response.body);

      return paitent;
    } else {
      final String errMaessage = response.body;
      throw Exception(errMaessage);
    }
  }
}
