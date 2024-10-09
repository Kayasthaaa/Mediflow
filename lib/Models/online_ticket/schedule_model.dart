class ScheduleModel {
  final int id;
  final DateTime date;
  final int quota;
  final int planId;
  ScheduleModel({
    required this.id,
    required this.date,
    required this.quota,
    required this.planId,
  });

  ScheduleModel.fromJson(Map<String, dynamic> map)
      : id = map['ID'],
        date = DateTime.parse(map['ScheduleDate']),
        quota = map['regQuota'],
        planId = map['PlanId'];
}
