// ignore_for_file: public_member_api_docs, sort_constructors_first
class BillingModeModel {
  final int id;
  final String name;
  final bool showPolicyNumber;
  BillingModeModel({
    required this.id,
    required this.name,
    required this.showPolicyNumber,
  });

  BillingModeModel.fromJson(Map<String, dynamic> map)
      : id = map['intBillingModeId'],
        name = map['strBillingMode'],
        showPolicyNumber = map['showPolicyNumber'] == 1;
}
