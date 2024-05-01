class DoctorModelWithoutToken {
  final String doctorLastName;
  final String doctorFirstName;
  final String email;
  final String doctorImage;
  //final String token;
  final String specification;
  final String education;
  final String country;
  final String street;
  final int rating;
  final String price;
  final int licenseId;
final int doctorId;
  const DoctorModelWithoutToken({
    required this.licenseId,
    required this.doctorId,
    required this.education,
    required this.country,
    required this.street,
    required this.doctorImage,
    required this.doctorFirstName,
    required this.specification,
    required this.rating,
    required this.price,
    required this.doctorLastName,
    required this.email,
   // required this.token
  });

  factory DoctorModelWithoutToken.fromJson(Map<String, dynamic> json) {
    return DoctorModelWithoutToken(
      licenseId: json['license_id'],
      doctorId: json['doctor_id'],
        education: json['education'],
        country: json['country'],
        street: json['street'],
        doctorImage: json['doctor_image'],
        doctorFirstName: json['first_name'],
        specification: json['specialization'],
        rating: json['rating'],
        price: json['price'],
        doctorLastName: json['last_name'],
        email: json['email'],
       // token: json['token']
        );
  }
}