class DoctorModel {
  final int id;
  final String doctorLastName;
  final String doctorFirstName;
  final String email;
  final String doctorImage;
  final String token;
  final String specification;
  final String education;
  final String country;
  final String street;
  final int rating;
  final String price;

  const DoctorModel(
      {required this.id,
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
      required this.token});

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
        id: json['doctor']['doctor_id'],
        education: json['doctor']['education'],
        country: json['doctor']['country'],
        street: json['doctor']['street'],
        doctorImage: json['doctor']['doctor_image'],
        doctorFirstName: json['doctor']['first_name'],
        specification: json['doctor']['specialization'],
        rating: json['doctor']['rating'],
        price: json['doctor']['price'],
        doctorLastName: json['doctor']['last_name'],
        email: json['doctor']['email'],
        token: json['token']);
  }
}
