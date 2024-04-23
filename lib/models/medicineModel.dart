class MedicineModel {
  final String medicineName;
  final int id;

  MedicineModel({required this.medicineName, required this.id});

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
        medicineName: json['medication_name'], 
        id:json ['medicine_id']);
  }
}
