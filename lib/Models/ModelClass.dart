// ignore: file_names
import 'dart:convert';

// this is model class for Global Token when app starts
class AppBeginToken {
  String? token;

  AppBeginToken({this.token});

  AppBeginToken.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}

// this is model class for patient logins

PatientsRequestLoginModels patientsRequestLoginModelsFromJson(String str) =>
    PatientsRequestLoginModels.fromJson(json.decode(str));

String patientsRequestLoginModelsToJson(PatientsRequestLoginModels data) =>
    json.encode(data.toJson());

class PatientsRequestLoginModels {
  PatientsRequestLoginModels({
    this.code,
    required this.username,
    required this.password,
  });

  String? code;
  String username;
  String password;

  factory PatientsRequestLoginModels.fromJson(Map<String, dynamic> json) =>
      PatientsRequestLoginModels(
        code: json["code"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "username": username,
        "password": password,
      };
}
// this is model class for patient login

PatientsResponseLoginModels patientsResponseLoginModelsFromJson(String str) =>
    PatientsResponseLoginModels.fromJson(json.decode(str));

String patientsResponseLoginModelsToJson(PatientsResponseLoginModels data) =>
    json.encode(data.toJson());

class PatientsResponseLoginModels {
  PatientsResponseLoginModels({
    this.id,
    this.patientId,
    this.cemRno,
    this.isAuthorize,
    this.registrationFrom,
    this.password,
    this.passwords,
    this.key,
    this.srtfname,
    this.strMname,
    this.strLname,
    this.strGender,
    this.dtmDob,
    this.country,
    this.state,
    this.district,
    this.districtName,
    this.vdcMunicipality,
    this.municipality,
    this.strWard,
    this.strGuardian,
    this.strRelation,
    this.intmobile,
    this.strEmail,
    this.fileNumber,
    this.strPanNo,
    this.dtmentrydate,
    this.dtmUpdatedate,
    this.isActive,
    this.strPolicyNo,
    this.identityType,
    this.identtityNo,
    this.expiryDate,
    this.profilePic,
    this.deviceIdentity,
    this.role,
    this.token,
    this.username,
    this.fullName,
    this.encryptedId,
  });

  int? id;
  int? patientId;
  String? cemRno;
  bool? isAuthorize;
  dynamic registrationFrom;
  dynamic password;
  dynamic passwords;
  dynamic key;
  String? srtfname;
  dynamic strMname;
  String? strLname;
  String? strGender;
  String? dtmDob;
  int? country;
  int? state;
  int? district;
  dynamic districtName;
  int? vdcMunicipality;
  dynamic municipality;
  int? strWard;
  dynamic strGuardian;
  dynamic strRelation;
  String? intmobile;
  String? strEmail;
  dynamic fileNumber;
  dynamic strPanNo;
  String? dtmentrydate;
  String? dtmUpdatedate;
  int? isActive;
  dynamic strPolicyNo;
  dynamic identityType;
  dynamic identtityNo;
  String? expiryDate;
  String? profilePic;
  dynamic deviceIdentity;
  String? role;
  String? token;
  dynamic username;
  dynamic fullName;
  dynamic encryptedId;

  factory PatientsResponseLoginModels.fromJson(Map<String, dynamic> json) =>
      PatientsResponseLoginModels(
        id: json["id"],
        patientId: json["patientID"],
        cemRno: json["cemRno"],
        isAuthorize: json["isAuthorize"],
        registrationFrom: json["registrationFrom"],
        password: json["password"],
        passwords: json["passwords"],
        key: json["key"],
        srtfname: json["srtfname"],
        strMname: json["strMname"],
        strLname: json["strLname"],
        strGender: json["strGender"],
        dtmDob: json["dtmDOB"],
        country: json["country"],
        state: json["state"],
        district: json["district"],
        districtName: json["districtName"],
        vdcMunicipality: json["vdcMunicipality"],
        municipality: json["municipality"],
        strWard: json["strWard"],
        strGuardian: json["strGuardian"],
        strRelation: json["strRelation"],
        intmobile: json["intmobile"],
        strEmail: json["strEmail"],
        fileNumber: json["fileNumber"],
        strPanNo: json["strPanNo"],
        dtmentrydate: json["dtmentrydate"],
        dtmUpdatedate: json["dtmUpdatedate"],
        isActive: json["isActive"],
        strPolicyNo: json["strPolicyNo"],
        identityType: json["identityType"],
        identtityNo: json["identtityNo"],
        expiryDate: json["expiryDate"],
        profilePic: json["profilePic"],
        deviceIdentity: json["deviceIdentity"],
        role: json["role"],
        token: json["token"],
        username: json["username"],
        fullName: json["fullName"],
        encryptedId: json["encryptedId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patientID": patientId,
        "cemRno": cemRno,
        "isAuthorize": isAuthorize,
        "registrationFrom": registrationFrom,
        "password": password,
        "passwords": passwords,
        "key": key,
        "srtfname": srtfname,
        "strMname": strMname,
        "strLname": strLname,
        "strGender": strGender,
        "dtmDOB": dtmDob,
        "country": country,
        "state": state,
        "district": district,
        "districtName": districtName,
        "vdcMunicipality": vdcMunicipality,
        "municipality": municipality,
        "strWard": strWard,
        "strGuardian": strGuardian,
        "strRelation": strRelation,
        "intmobile": intmobile,
        "strEmail": strEmail,
        "fileNumber": fileNumber,
        "strPanNo": strPanNo,
        "dtmentrydate": dtmentrydate,
        "dtmUpdatedate": dtmUpdatedate,
        "isActive": isActive,
        "strPolicyNo": strPolicyNo,
        "identityType": identityType,
        "identtityNo": identtityNo,
        "expiryDate": expiryDate,
        "profilePic": profilePic,
        "deviceIdentity": deviceIdentity,
        "role": role,
        "token": token,
        "username": username,
        "fullName": fullName,
        "encryptedId": encryptedId,
      };
}

// from this is model class for doctor login

DoctorRequestLoginModels doctorRequestLoginModelsFromJson(String str) =>
    DoctorRequestLoginModels.fromJson(json.decode(str));

String doctorRequestLoginModelsToJson(DoctorRequestLoginModels data) =>
    json.encode(data.toJson());

class DoctorRequestLoginModels {
  DoctorRequestLoginModels({
    required this.code,
    required this.username,
    required this.password,
  });

  String code;
  String username;
  String password;

  factory DoctorRequestLoginModels.fromJson(Map<String, dynamic> json) =>
      DoctorRequestLoginModels(
        code: json["code"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "username": username,
        "password": password,
      };
}

DoctorResponseLoginModels doctorResponseLoginModelsFromJson(String str) =>
    DoctorResponseLoginModels.fromJson(json.decode(str));

String doctorResponseLoginModelsToJson(DoctorResponseLoginModels data) =>
    json.encode(data.toJson());

class DoctorResponseLoginModels {
  DoctorResponseLoginModels({
    this.doctorId,
    this.nmCno,
    this.doctorName,
    this.contactNo,
    this.username,
    this.emailId,
    this.strEmail,
    this.id,
    this.intMobile,
    this.gender,
    this.currentAddress,
    this.depId,
    this.entryDate,
    this.password,
    this.code,
    this.isActive,
    this.hospitalName,
    this.department,
    this.deviceId,
    this.profile,
    this.token,
    this.role,
  });

  int? doctorId;
  String? nmCno;
  String? doctorName;
  String? contactNo;
  dynamic? username;
  String? emailId;
  String? strEmail;
  int? id;
  String? intMobile;
  dynamic gender;
  String? currentAddress;
  int? depId;
  String? entryDate;
  dynamic? password;
  dynamic? code;
  bool? isActive;
  dynamic? hospitalName;
  dynamic? department;
  dynamic? deviceId;
  String? profile;
  String? token;
  String? role;

  factory DoctorResponseLoginModels.fromJson(Map<String, dynamic> json) =>
      DoctorResponseLoginModels(
        doctorId: json["doctorID"],
        nmCno: json["nmCno"],
        doctorName: json["doctorName"],
        contactNo: json["contactNo"],
        username: json["username"],
        emailId: json["emailID"],
        strEmail: json["strEmail"],
        id: json["id"],
        intMobile: json["intMobile"],
        gender: json["gender"],
        currentAddress: json["currentAddress"],
        depId: json["depId"],
        entryDate: json["entryDate"],
        password: json["password"],
        code: json["code"],
        isActive: json["isActive"],
        hospitalName: json["hospitalName"],
        department: json["department"],
        deviceId: json["deviceId"],
        profile: json["profile"],
        token: json["token"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "doctorID": doctorId,
        "nmCno": nmCno,
        "doctorName": doctorName,
        "contactNo": contactNo,
        "username": username,
        "emailID": emailId,
        "strEmail": strEmail,
        "id": id,
        "intMobile": intMobile,
        "gender": gender,
        "currentAddress": currentAddress,
        "depId": depId,
        "entryDate": entryDate,
        "password": password,
        "code": code,
        "isActive": isActive,
        "hospitalName": hospitalName,
        "department": department,
        "deviceId": deviceId,
        "profile": profile,
        "token": token,
        "role": role,
      };
}

// this is model class for patinet registration

class NewPatientRegister {
  String? password;
  String? srtfname;
  String? strMname;
  String? strLname;
  String? strGender;
  String? dtmDOB;
  int? district;
  String? strEmail;
  String? intmobile;
  String? deviceIdentity;

  NewPatientRegister(
      {this.password,
      this.srtfname,
      this.strMname,
      this.strLname,
      this.strGender,
      this.dtmDOB,
      this.district,
      this.strEmail,
      this.intmobile,
      this.deviceIdentity});

  NewPatientRegister.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    srtfname = json['srtfname'];
    strMname = json['strMname'];
    strLname = json['strLname'];
    strGender = json['strGender'];
    dtmDOB = json['dtmDOB'];
    district = json['District'];
    strEmail = json['strEmail'];
    intmobile = json['intmobile'];
    deviceIdentity = json['DeviceIdentity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['srtfname'] = this.srtfname;
    data['strMname'] = this.strMname;
    data['strLname'] = this.strLname;
    data['strGender'] = this.strGender;
    data['dtmDOB'] = this.dtmDOB;
    data['District'] = this.district;
    data['strEmail'] = this.strEmail;
    data['intmobile'] = this.intmobile;
    data['DeviceIdentity'] = this.deviceIdentity;
    return data;
  }
}

// this is model class for patient response

class PatientResponse {
  String? code;
  Data? data;

  PatientResponse({this.code, this.data});

  PatientResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? cemRno;
  String? password;

  Data({this.cemRno, this.password});

  Data.fromJson(Map<String, dynamic> json) {
    cemRno = json['cemRno'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cemRno'] = this.cemRno;
    data['password'] = this.password;
    return data;
  }
}

// this is model class for Transactions

Transactions transactionsFromJson(String str) =>
    Transactions.fromJson(json.decode(str));

String transactionsToJson(Transactions data) => json.encode(data.toJson());

class Transactions {
  Transactions({
    this.code,
    required this.data,
  });

  String? code;
  List<Datum> data;

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.fullname,
    this.dob,
    this.hospitalName,
    this.hosId,
    this.hospitalBillno,
    this.hospitalBill,
    this.patientId,
    this.visitId,
    this.consultdate,
    this.consultantDate,
    this.department,
    this.consultant,
    this.nmcno,
    this.payId,
    this.fcm,
    this.transactionId,
    this.entrydate,
    this.txnNo,
    this.date,
    this.pData,
    this.datumNew,
    this.old,
    this.hosImage,
    this.image,
    this.gatewayImage,
    this.gateway,
    this.removeId,
    this.corpoName,
    this.queueNo,
    this.roomNo,
    this.followUp,
    this.status,
    this.message,
    this.msgId,
    this.amount,
    this.gender,
    this.fullAddress,
    this.hospAddress,
    this.billingmode,
    this.cemr,
    this.transactionUrl,
    this.type,
    this.consultdatenep,
    this.policyno,
    this.claimcode,
  });

  int? id;
  dynamic? name;
  String? fullname;
  String? dob;
  String? hospitalName;
  int? hosId;
  dynamic? hospitalBillno;
  String? hospitalBill;
  String? patientId;
  String? visitId;
  String? consultdate;
  String? consultantDate;
  String? department;
  String? consultant;
  String? nmcno;
  int? payId;
  dynamic fcm;
  String? transactionId;
  String? entrydate;
  dynamic? txnNo;
  String? date;
  dynamic pData;
  int? datumNew;
  int? old;
  dynamic? hosImage;
  String? image;
  String? gatewayImage;
  String? gateway;
  int? removeId;
  String? corpoName;
  String? queueNo;
  String? roomNo;
  String? followUp;
  bool? status;
  dynamic? message;
  int? msgId;
  String? amount;
  String? gender;
  dynamic? fullAddress;
  dynamic hospAddress;
  String? billingmode;
  String? cemr;
  String? transactionUrl;
  dynamic type;
  dynamic consultdatenep;
  dynamic policyno;
  dynamic claimcode;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        fullname: json["fullname"],
        dob: json["dob"],
        hospitalName: json["hospitalName"],
        hosId: json["hosId"],
        hospitalBillno: json["hospitalBillno"],
        hospitalBill: json["hospitalBill"],
        patientId: json["patientId"],
        visitId: json["visitId"],
        consultdate: json["consultdate"],
        consultantDate: json["consultantDate"],
        department: json["department"],
        consultant: json["consultant"],
        nmcno: json["nmcno"],
        payId: json["payId"],
        fcm: json["fcm"],
        transactionId: json["transactionId"],
        entrydate: json["entrydate"],
        txnNo: json["txnNo"],
        date: json["date"],
        pData: json["pData"],
        datumNew: json["new"],
        old: json["old"],
        hosImage: json["hosImage"],
        image: json["image"],
        gatewayImage: json["gatewayImage"],
        gateway: json["gateway"],
        removeId: json["removeId"],
        corpoName: json["corpoName"],
        queueNo: json["queueNo"],
        roomNo: json["roomNo"],
        followUp: json["followUp"],
        status: json["status"],
        message: json["message"],
        msgId: json["msgId"],
        amount: json["amount"],
        gender: json["gender"],
        fullAddress: json["fullAddress"],
        hospAddress: json["hospAddress"],
        billingmode: json["billingmode"],
        cemr: json["cemr"],
        transactionUrl: json["transactionUrl"],
        type: json["type"],
        consultdatenep: json["consultdatenep"],
        policyno: json["policyno"],
        claimcode: json["claimcode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fullname": fullname,
        "dob": dob,
        "hospitalName": hospitalName,
        "hosId": hosId,
        "hospitalBillno": hospitalBillno,
        "hospitalBill": hospitalBill,
        "patientId": patientId,
        "visitId": visitId,
        "consultdate": consultdate,
        "consultantDate": consultantDate,
        "department": department,
        "consultant": consultant,
        "nmcno": nmcno,
        "payId": payId,
        "fcm": fcm,
        "transactionId": transactionId,
        "entrydate": entrydate,
        "txnNo": txnNo,
        "date": date,
        "pData": pData,
        "new": datumNew,
        "old": old,
        "hosImage": hosImage,
        "image": image,
        "gatewayImage": gatewayImage,
        "gateway": gateway,
        "removeId": removeId,
        "corpoName": corpoName,
        "queueNo": queueNo,
        "roomNo": roomNo,
        "followUp": followUp,
        "status": status,
        "message": message,
        "msgId": msgId,
        "amount": amount,
        "gender": gender,
        "fullAddress": fullAddress,
        "hospAddress": hospAddress,
        "billingmode": billingmode,
        "cemr": cemr,
        "transactionUrl": transactionUrl,
        "type": type,
        "consultdatenep": consultdatenep,
        "policyno": policyno,
        "claimcode": claimcode,
      };
}
