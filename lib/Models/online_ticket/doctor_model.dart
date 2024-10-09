// ignore_for_file: public_member_api_docs, sort_constructors_first
class DoctorModel {
  final int id;
  final String name;
  final String post;
  final int estimatedTime;
  DoctorModel({
    required this.id,
    required this.name,
    required this.post,
    required this.estimatedTime,
  });

  DoctorModel.fromJson(Map<String, dynamic> map)
      : id = map['ID'],
        name = map['strdoctorName'],
        post = map['strPost'],
        estimatedTime = map['EstimatedTime'];
}
