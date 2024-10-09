// ignore_for_file: public_member_api_docs, sort_constructors_first
class MunicipalityModel {
  final int id;
  final String name;
  MunicipalityModel({
    required this.id,
    required this.name,
  });

  MunicipalityModel.fromJson(Map<String, dynamic> map)
      : id = map['mID'],
        name = map['Municipality'];
}
