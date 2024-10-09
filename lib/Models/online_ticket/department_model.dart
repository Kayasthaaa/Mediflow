// ignore_for_file: public_member_api_docs, sort_constructors_first
class DepartmentModel {
  int id;
  String name;
  String hod;
  DepartmentModel({
    required this.id,
    required this.name,
    required this.hod,
  });

  DepartmentModel.fromJson(Map<String, dynamic> map)
      : id = map['ID'] ?? 0,
        name = map['strDepartment'] ?? '',
        hod = map['strHOD'] ?? '';
}
