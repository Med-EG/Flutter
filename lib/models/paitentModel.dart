class PaitentInfo {
  final String firstName;
  final String lastName;
  final String username;
  final String password;
  final String gender;
  final int nationalId;
  final String email;
  final String address;
  final String birthDate;
  final String phoneNumber;
  final String token;
  PaitentInfo(this.token,
      {required this.firstName,
      required this.lastName,
      required this.username,
      required this.password,
      required this.gender,
      required this.nationalId,
      required this.email,
      required this.address,
      required this.birthDate,
      required this.phoneNumber});
}
