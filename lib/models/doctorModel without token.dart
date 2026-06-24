class DoctorModelWithoutToken {
  final int doctorID;
  final String doctorLastName;
  final String doctorFirstName;
  final String email;
  final String doctorImage;
  final String specification;
  final String education;
  final String country;
  final String street;
  final int rating;
  final String price;
  final int licenseId;
  const DoctorModelWithoutToken( {
    required this.doctorID,
    required this.licenseId,
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
  });

  factory DoctorModelWithoutToken.fromJson(Map<String, dynamic> json) {
    return DoctorModelWithoutToken(
      doctorID: json['doctor_id'],
      licenseId: json['license_id'],
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
        );
  }
}