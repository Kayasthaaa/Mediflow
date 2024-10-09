// ignore_for_file: public_member_api_docs, sort_constructors_first
class DistrictModel {
  final int id;
  final String name;
  DistrictModel({
    required this.id,
    required this.name,
  });

  DistrictModel.fromJson(Map<String, dynamic> map)
      : id = map['ID'],
        name = map['DistrictName'];
}
