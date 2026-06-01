class PatientInfoWithoutToken {
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
  final String personalImage;
  PatientInfoWithoutToken(
      {required this.firstName,
      required this.id, 
      required this.lastName,
      required this.username,
      required this.gender,
      required this.nationalId,
      required this.email,
      required this.address,
      required this.birthDate,
      required this.phoneNumber,
      required this.personalImage, });

      factory PatientInfoWithoutToken.fromJson(json){
        return PatientInfoWithoutToken(
        firstName: json['first_name'],
       lastName: json['last_name'],
       id: json['patient_id'],
       username: json['username'],
       gender: json['gender'],
       nationalId: json['national_id'],
       email: json['email'],
       address: json['address'],
       birthDate: json['birth_date'],
       phoneNumber: json['phone_number'],
       personalImage: json['personal_image']);
}

}