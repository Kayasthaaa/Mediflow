import 'package:mediflow_bloc/constant/app_url.dart';

class HospitalModel {
  int id;
  String name;
  String mailingName;
  String address;
  String phone;
  String mobile;
  String country;
  String companyPrefix;
  String logoUrl;
  HospitalModel({
    required this.id,
    required this.name,
    required this.mailingName,
    required this.address,
    required this.phone,
    required this.mobile,
    required this.country,
    required this.companyPrefix,
    required this.logoUrl,
  });

  HospitalModel.fromJson(Map<String, dynamic> map)
      : id = map['companyId'] ?? 0,
        name = map['companyName'] ?? '',
        mailingName = map['mailingName'] ?? '',
        address = map['address'] ?? '',
        phone = map['phone'] ?? '',
        mobile = map['mobile'] ?? '',
        country = map['country'] ?? '',
        companyPrefix = map['companyPrefix'] ?? '',
        logoUrl = kMediflowApiUrl + map['logoimage'];
}
