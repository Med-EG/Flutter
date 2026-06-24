// ignore_for_file: file_names

class MedicalInfoModel {
  final int medicineId;
  final String medicineName;
  final int? doctorId;
  final String? notes;
  final String dose;
  final String frequency;
  MedicalInfoModel({
    required this.medicineId,
    required this.medicineName,
    required this.dose,
    required this.frequency,
    this.doctorId,
    this.notes,
  });

  factory MedicalInfoModel.fromJson(json) {
    return MedicalInfoModel(
        medicineId: json['id'],
        medicineName: json['medicine_name'],
        dose: json['dose'],
        frequency: json['frequency'],
        doctorId: json['doctor_id'],
        notes: json['notes']);
  }
}
