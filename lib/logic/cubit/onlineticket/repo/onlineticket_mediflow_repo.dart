import 'package:dio/dio.dart';
import 'package:mediflow_bloc/Models/online_ticket/billingmode_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/department_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/district_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/doctor_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/hospital_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/insuree_detail_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/municipality_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/schedule_model.dart';
import 'package:mediflow_bloc/services/api_client.dart';

abstract class OnlineTicketMediflowRepo {
  static Future<List<HospitalModel>> getCompanyList() async {
    List<HospitalModel> hospitalList = [];
    Dio dio = await ApiClient.mediflowWithAuthApi();
    Response response = await dio.get('/api/v2/Registration/GetCompanyList/');
    if (response.statusCode == 200) {
      hospitalList = response.data['data'].map<HospitalModel>((e) {
        return HospitalModel.fromJson(e);
      }).toList();
    }
    return hospitalList;
  }

  static Future<List<BillingModeModel>> getBillingMode(int companyId) async {
    List<BillingModeModel> billingModeList = [];
    Dio dio = await ApiClient.mediflowWithAuthApi();
    Response response =
        await dio.get('/api/v2/Registration/GetBillingMode/$companyId/');
    if (response.statusCode == 200) {
      billingModeList = response.data['data'].map<BillingModeModel>((e) {
        return BillingModeModel.fromJson(e);
      }).toList();
    }
    return billingModeList;
  }

  static Future<List<DepartmentModel>> getDepartmentList(int companyId) async {
    List<DepartmentModel> departmentList = [];
    Dio dio = await ApiClient.mediflowWithAuthApi();
    Response response =
        await dio.get('/api/v2/Registration/GetDepartment/$companyId/');
    if (response.statusCode == 200) {
      departmentList = response.data['data'].map<DepartmentModel>((e) {
        return DepartmentModel.fromJson(e);
      }).toList();
    }
    return departmentList;
  }

  static Future<List<DoctorModel>> getDoctorByDepartment(
    int departmentId,
    int companyId,
  ) async {
    List<DoctorModel> doctorList = [];
    Dio dio = await ApiClient.mediflowWithAuthApi();
    Response response = await dio.get(
      '/api/v2/Registration/GetConsaltantByDepId',
      queryParameters: {
        'depId': departmentId,
        'cmpid': companyId,
      },
    );
    if (response.statusCode == 200) {
      doctorList = response.data['data'].map<DoctorModel>((e) {
        return DoctorModel.fromJson(e);
      }).toList();
    }
    return doctorList;
  }

  static Future<List<ScheduleModel>> getDoctorSchedule(
    int billingModeId,
    int departmentId,
    int consultantId,
    int companyId,
  ) async {
    List<ScheduleModel> scheduleList = [];
    Dio dio = await ApiClient.mediflowWithAuthApi();
    Response response = await dio.get(
      '/api/v2/Registration/GetConsaltantScheduleList',
      queryParameters: {
        'billId': billingModeId,
        'depId': departmentId,
        'consultId': consultantId,
        'companyId': companyId,
      },
    );
    if (response.statusCode == 200) {
      scheduleList = response.data['data'].map<ScheduleModel>((e) {
        return ScheduleModel.fromJson(e);
      }).toList();
    }
    return scheduleList;
  }

  static Future<List<DoctorModel>> getAllDoctor() async {
    List<DoctorModel> doctorList = [];
    Dio dio = await ApiClient.mediflowWithAuthApi();
    Response response = await dio.get(
      '/api/v2/Registration/GetAllDoctorForBooking',
    );
    if (response.statusCode == 200) {
      doctorList = response.data['data'].map<DoctorModel>((e) {
        return DoctorModel.fromJson(e);
      }).toList();
    }
    return doctorList;
  }

  static Future<List<HospitalModel>> getAllCompanyByDoctor(int doctorId) async {
    List<HospitalModel> hospitalList = [];
    Dio dio = await ApiClient.mediflowWithAuthApi();
    Response response =
        await dio.get('/api/v2/Registration/GetAllCompanyByDoctor/$doctorId');
    if (response.statusCode == 200) {
      hospitalList = response.data['data'].map<HospitalModel>((e) {
        return HospitalModel.fromJson(e);
      }).toList();
    }
    return hospitalList;
  }

  static Future<List<DepartmentModel>> getAllDepartmentByDoctor(
      int doctorId, int companyId) async {
    List<DepartmentModel> departmentList = [];
    Dio dio = await ApiClient.mediflowWithAuthApi();
    Response response = await dio.get(
      '/api/v2/Registration/GetDepartmentByDoctor',
      queryParameters: {
        'companyId': companyId,
        'doctorId': doctorId,
      },
    );
    if (response.statusCode == 200) {
      departmentList = response.data['data'].map<DepartmentModel>((e) {
        return DepartmentModel.fromJson(e);
      }).toList();
    }
    return departmentList;
  }

  static Future<List<DistrictModel>> getDistrict() async {
    List<DistrictModel> districtList = [];
    Dio dio = await ApiClient.mediflowWithAuthApi();
    Response response = await dio.get('/api/v2/Registration/GetDistrict');
    if (response.statusCode == 200) {
      districtList = response.data['data'].map<DistrictModel>((e) {
        return DistrictModel.fromJson(e);
      }).toList();
    }
    return districtList;
  }

  static Future<List<MunicipalityModel>> getMunicipality(int districtId) async {
    List<MunicipalityModel> municipalityList = [];
    Dio dio = await ApiClient.mediflowWithAuthApi();
    Response response = await dio.get(
        '/api/v2/Registration/GetMunicipalityGetById?districtid=$districtId');
    if (response.statusCode == 200) {
      municipalityList = response.data['data'].map<MunicipalityModel>((e) {
        return MunicipalityModel.fromJson(e);
      }).toList();
    }
    return municipalityList;
  }

  static Future<InsureeDetailModel?> getInsureeDetail(
      String policynumber, String type) async {
    InsureeDetailModel? insureeDetailModel;
    Dio dio = await ApiClient.mediflowWithAuthApi();
    Response response = await dio.get(
      '/api/v2/Insurance/GetInsurerDetail',
      queryParameters: {
        'policyno': policynumber,
        'type': type,
      },
    );
    if (response.statusCode == 200) {
      insureeDetailModel = InsureeDetailModel.fromJson(response.data['data']);
    }
    return insureeDetailModel;
  }

  static Future<List<String>> getScheduleTime(
    int consultantId,
    int billingModeId,
    int companyId,
    int departmentId,
    int planId,
    DateTime date,
  ) async {
    List<String> time = [];
    Dio dio = await ApiClient.mediflowWithAuthApi();
    Response response = await dio.get(
      '/api/v2/Registration/GetAvailableTime',
      queryParameters: {
        'consultId': consultantId,
        'billingId': billingModeId,
        'companyId': companyId,
        'departmentId': departmentId,
        'planId': planId,
        'date': date,
      },
    );
    if (response.statusCode == 200) {
      time = response.data['data'].map<String>((e) => e.toString()).toList();
    }
    return time;
  }
}
