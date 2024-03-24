class PatientInfo {
  final String firstName;
  final String lastName;
  final String username;
  final String password;
  final String gender;
  final int nationalId;
  final String email;
  final String address;
  final String birthDate;
  final int phoneNumber;
  final String token;
  final String personalImage;
  PatientInfo(
      {required this.firstName,
      required this.token,
      required this.lastName,
      required this.username,
      required this.password,
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
       username: json['patient']['username'],
       password: json['patient']['password'],
       gender: json['patient']['gender'],
       nationalId: json['patient']['national_id'],
       email: json['patient']['email'],
       address: json['patient']['address'],
       birthDate: json['patient']['birth_date'],
       phoneNumber: json['patient']['phone_number'],
       personalImage: json['patient']['phone_numberpersonal_image']);
}
}