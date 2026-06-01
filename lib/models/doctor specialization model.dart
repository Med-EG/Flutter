class DoctorSpecializationModel {
  final String name;

  DoctorSpecializationModel({required this.name});

  factory DoctorSpecializationModel.fromJson(String specialization) {
    return DoctorSpecializationModel(
      name: specialization,
    );
  }
}