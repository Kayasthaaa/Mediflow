// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class InsureeDetailModel {
  final String fname;
  final String lname;
  final String gender;
  final String age;
  InsureeDetailModel({
    required this.fname,
    required this.lname,
    required this.gender,
    required this.age,
  });

  InsureeDetailModel.fromJson(Map<String, dynamic> map)
      : fname = map['fname'],
        lname = map['lname'],
        gender = toBeginningOfSentenceCase(map['gender']).toString(),
        age = map['age'];
}
