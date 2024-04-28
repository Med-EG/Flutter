class PatientInfo {
  final String firstName;
  final String lastName;
  final String username;
  final int id;
  final String gender;
  final int nationalId;
  final String email;
  final String address;
  final String birthDate;
  final int phoneNumber;
  final String token;
  final String personalImage;
  final int medicalRecordID;
  PatientInfo(
      {required this.medicalRecordID,
      required this.firstName,
      required this.id, 
      required this.token,
      required this.lastName,
      required this.username,
      required this.gender,
      required this.nationalId,
      required this.email,
      required this.address,
      required this.birthDate,
      required this.phoneNumber,
      required this.personalImage, });

      factory PatientInfo.fromJson(json){
        return PatientInfo(
         token: json['token'],
        firstName: json['patient']['first_name'],
       lastName: json['patient']['last_name'],
       id: json['patient']['patient_id'],
       username: json['patient']['username'],
       gender: json['patient']['gender'],
       nationalId: json['patient']['national_id'],
       email: json['patient']['email'],
       address: json['patient']['address'],
       birthDate: json['patient']['birth_date'],
       phoneNumber: json['patient']['phone_number'],
       personalImage: json['patient']['personal_image'],
       medicalRecordID: json['patient']['basic_medical_info']['medical_record_id']
       );
}

}