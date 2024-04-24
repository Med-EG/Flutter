class OperationInfoModel {
  final DateTime operationDate;
  final String operationName;
  final int operationId;
  final String? surgeonName;
  final String? notes;
  OperationInfoModel({
    required this.operationDate,
    required this.operationName,
    required this.operationId,
    this.surgeonName,
    this.notes
  });

  factory OperationInfoModel.fromJson(json) {
    return OperationInfoModel(
        operationDate: json['operation_date'],
        operationName: json['operation_name'],
        operationId:json['id'],
        surgeonName:json['surgeon_name'],
        notes: json['operation_notes']
        );
  }
}