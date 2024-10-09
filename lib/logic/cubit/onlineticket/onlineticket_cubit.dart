import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mediflow_bloc/Models/online_ticket/billingmode_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/department_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/district_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/doctor_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/hospital_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/insuree_detail_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/municipality_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/schedule_model.dart';
import 'package:mediflow_bloc/constant/age_one_list.dart';
import 'package:mediflow_bloc/constant/age_two_list.dart';
import 'package:mediflow_bloc/constant/gender_list.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/repo/onlineticket_mediflow_repo.dart';
import 'package:mediflow_bloc/services/navigation_service.dart';
import 'package:mediflow_bloc/widgets/snackbar/error_snackbar.dart';

part 'onlineticket_state.dart';

class OnlineticketCubit extends Cubit<OnlineticketState> {
  OnlineticketCubit() : super(OnlineticketInitial()) {
    emit(state.copyWith(ctx: NavigationService.navigatorKey.currentContext));
  }

  getCompanyList() async {
    if (state.ctx != null) {
      try {
        emit(state.copyWith(
          loading: true,
          allDoctorMode: false,
        ));
        List<HospitalModel> hospitalList =
            await OnlineTicketMediflowRepo.getCompanyList();
        emit(state.copyWith(
          loading: false,
          hospitalList: hospitalList,
          hospitalSearchList: hospitalList,
        ));
      } catch (e) {
        showErrorSnackBar(state.ctx!, 'Could not load hospital list');
        emit(state.copyWith(
          loading: false,
        ));
      }
    }
  }

  changeHospitalQuery(String value) {
    String query = value.trim().toLowerCase();
    if (query == '') {
      emit(state.copyWith(
        hospitalSearchList: state.hospitalList,
      ));
    } else {
      List<HospitalModel> hospitalSearchList = state.hospitalList
          .where(
            (e) => e.name.toLowerCase().replaceAll('.', '').contains(query),
          )
          .toList();
      emit(state.copyWith(
        hospitalSearchList: hospitalSearchList,
      ));
    }
  }

  getBillingMode() async {
    emit(state.copyWith(loading: true));
    List<BillingModeModel> billingModeList =
        await OnlineTicketMediflowRepo.getBillingMode(state.companyId);
    emit(state.copyWith(
      loading: false,
      billingModeList: billingModeList,
      billingModeModel: billingModeList.isEmpty
          ? OnlineticketInitial().billingModeModel
          : billingModeList.first,
    ));
  }

  changeBillingMode(BillingModeModel billingModeModel) {
    emit(state.copyWith(
      billingModeModel: billingModeModel,
    ));
  }

  changeSelectedTime(String value) {
    emit(state.copyWith(
      selectedTime: value,
    ));
  }

  getDepartment(int companyId) async {
    if (state.ctx != null) {
      try {
        emit(state.copyWith(
          loading: true,
          companyId: companyId,
        ));
        // getting department list
        List<DepartmentModel> departmentList =
            await OnlineTicketMediflowRepo.getDepartmentList(companyId);
        // getting billing mode
        List<BillingModeModel> billingmodeList =
            await OnlineTicketMediflowRepo.getBillingMode(companyId);
        emit(state.copyWith(
          loading: false,
          billingModeList: billingmodeList,
          departmentList: departmentList,
          departmentSearchList: departmentList,
          billingModeModel: billingmodeList.isEmpty
              ? OnlineticketInitial().billingModeModel
              : billingmodeList.first,
          scheduleModel: OnlineticketInitial().scheduleModel,
        ));
      } catch (e) {
        showErrorSnackBar(state.ctx!, 'Could not get department list');
        emit(state.copyWith(
          departmentList: [],
          departmentSearchList: [],
          loading: false,
        ));
      }
    }
  }

  changeDepartmentQuery(String value) {
    String query = value.trim().toLowerCase();
    if (query == '') {
      emit(state.copyWith(
        departmentSearchList: state.departmentList,
      ));
    } else {
      List<DepartmentModel> departmentSearchList = state.departmentList
          .where(
            (e) => e.name.toLowerCase().contains(query),
          )
          .toList();
      emit(state.copyWith(
        departmentSearchList: departmentSearchList,
      ));
    }
  }

  getDoctor(int departmentId) async {
    if (state.ctx != null) {
      try {
        emit(state.copyWith(
          loading: true,
          departmentId: departmentId,
        ));
        List<DoctorModel> doctorList =
            await OnlineTicketMediflowRepo.getDoctorByDepartment(
          departmentId,
          state.companyId,
        );
        emit(state.copyWith(
          loading: false,
          doctorList: doctorList,
          doctorSearchList: doctorList,
        ));
      } catch (e) {
        showErrorSnackBar(state.ctx!, 'Could not load doctor list');
        emit(state.copyWith(
          doctorList: [],
          doctorSearchList: [],
          loading: false,
        ));
      }
    }
  }

  changeDoctorQuery(String value) {
    String query = value.trim().toLowerCase();
    if (query == '') {
      emit(state.copyWith(
        doctorSearchList: state.doctorList,
      ));
    } else {
      List<DoctorModel> doctorSearchList = state.doctorList
          .where(
            (e) => e.name.toLowerCase().contains(query),
          )
          .toList();
      emit(state.copyWith(
        doctorSearchList: doctorSearchList,
      ));
    }
  }

  selectDoctor({DoctorModel? doctorModel, int? departmentId}) async {
    if (state.ctx != null) {
      emit(state.copyWith(
        doctorModel: doctorModel ?? state.doctorModel,
        loading: true,
        scheduleModel: OnlineticketInitial().scheduleModel,
        departmentId: departmentId ?? state.departmentId,
      ));
      try {
        List<ScheduleModel> scheduleList =
            await OnlineTicketMediflowRepo.getDoctorSchedule(
          state.billingModeModel.id,
          departmentId ?? state.departmentId,
          doctorModel == null ? state.doctorModel.id : doctorModel.id,
          state.companyId,
        );
        emit(state.copyWith(
          loading: false,
          scheduleList: scheduleList,
        ));
      } catch (e) {
        showErrorSnackBar(state.ctx!, 'Could not get doctor\'s schedule');
        emit(state.copyWith(
          loading: false,
          scheduleList: [],
        ));
      }
    }
  }

  selectSchedule(ScheduleModel scheduleModel) async {
    if (state.ctx != null) {
      try {
        emit(state.copyWith(
          scheduleModel: scheduleModel,
          selectedTime: '',
          loading: true,
        ));
        List<String> availableTime =
            await OnlineTicketMediflowRepo.getScheduleTime(
          state.doctorModel.id,
          state.billingModeModel.id,
          state.companyId,
          state.departmentId,
          state.scheduleModel.planId,
          state.scheduleModel.date,
        );
        emit(state.copyWith(
          loading: false,
          availableTime: availableTime,
        ));
      } catch (e) {
        showErrorSnackBar(state.ctx!, 'Could not load schedule time');
        emit(state.copyWith(
          loading: false,
          availableTime: [],
          selectedTime: '',
        ));
      }
    }
  }

  getAllDoctor() async {
    if (state.ctx != null) {
      try {
        emit(state.copyWith(
          loading: true,
          allDoctorMode: true,
        ));
        List<DoctorModel> doctorList =
            await OnlineTicketMediflowRepo.getAllDoctor();
        emit(state.copyWith(
          loading: false,
          allDoctorList: doctorList,
          allDoctorSearchList: doctorList,
        ));
      } catch (e) {
        showErrorSnackBar(state.ctx!, 'Could not load doctor list');
        emit(state.copyWith(
          loading: false,
        ));
      }
    }
  }

  changeAllDoctorQuery(String value) {
    String query = value.trim().toLowerCase();
    if (query == '') {
      emit(state.copyWith(
        allDoctorSearchList: state.allDoctorList,
      ));
    } else {
      List<DoctorModel> doctorSearchList = state.allDoctorList
          .where(
            (e) => e.name.toLowerCase().contains(query),
          )
          .toList();
      emit(state.copyWith(
        allDoctorSearchList: doctorSearchList,
      ));
    }
  }

  getCompanyListForDoctor({
    DoctorModel? doctorModel,
    bool? isRefresh,
  }) async {
    if (state.ctx != null) {
      try {
        emit(state.copyWith(
          hospitalListForDoctor: [],
          hospitalSearchListForDoctor: [],
          loading: true,
        ));
        List<HospitalModel> hospitalList =
            await OnlineTicketMediflowRepo.getAllCompanyByDoctor(
          isRefresh == true ? state.doctorModel.id : doctorModel!.id,
        );
        emit(state.copyWith(
          loading: false,
          hospitalListForDoctor: hospitalList,
          hospitalSearchListForDoctor: hospitalList,
          doctorModel: doctorModel ?? state.doctorModel,
        ));
      } catch (e) {
        showErrorSnackBar(
            state.ctx!, 'Could not load hospital list for doctor');
        emit(state.copyWith(
          loading: false,
          hospitalListForDoctor: [],
          hospitalSearchListForDoctor: [],
        ));
      }
    }
  }

  changeHospitalForDoctorQuery(String value) {
    String query = value.trim().toLowerCase();
    if (query == '') {
      emit(state.copyWith(
        hospitalSearchListForDoctor: state.hospitalListForDoctor,
      ));
    } else {
      List<HospitalModel> hospitalSearchList = state.hospitalListForDoctor
          .where(
            (e) => e.name.toLowerCase().replaceAll('.', '').contains(query),
          )
          .toList();
      emit(state.copyWith(
        hospitalSearchListForDoctor: hospitalSearchList,
      ));
    }
  }

  getDepartmentListForDoctor({
    int? companyId,
    bool? isRefresh,
  }) async {
    if (state.ctx != null) {
      try {
        emit(state.copyWith(
          loading: true,
          departmentListForDoctor: [],
          departmentSearchListForDoctor: [],
          companyId: companyId ?? state.companyId,
        ));
        if (isRefresh != true) {
          await getBillingMode();
        }
        List<DepartmentModel> departmentList =
            await OnlineTicketMediflowRepo.getAllDepartmentByDoctor(
          state.doctorModel.id,
          isRefresh == true ? state.companyId : companyId!,
        );
        emit(state.copyWith(
          loading: false,
          departmentListForDoctor: departmentList,
          departmentSearchListForDoctor: departmentList,
        ));
      } catch (e) {
        showErrorSnackBar(
            state.ctx!, 'Could not load department list for doctor');
        emit(state.copyWith(
          loading: false,
          departmentListForDoctor: [],
          departmentSearchListForDoctor: [],
        ));
      }
    }
  }

  changeDepartmentForDoctorQuery(String value) {
    String query = value.trim().toLowerCase();
    if (query == '') {
      emit(state.copyWith(
        departmentSearchListForDoctor: state.departmentListForDoctor,
      ));
    } else {
      List<DepartmentModel> departmentSearchList =
          state.departmentSearchListForDoctor
              .where(
                (e) => e.name.toLowerCase().replaceAll('.', '').contains(query),
              )
              .toList();
      emit(state.copyWith(
        departmentSearchListForDoctor: departmentSearchList,
      ));
    }
  }

  getDistrictAndMunicipality() async {
    if (state.ctx != null) {
      try {
        emit(state.copyWith(
          loading: true,
        ));
        List<DistrictModel> districtList =
            await OnlineTicketMediflowRepo.getDistrict();
        List<MunicipalityModel> municipalityList =
            await OnlineTicketMediflowRepo.getMunicipality(
                districtList.first.id);
        emit(state.copyWith(
          loading: false,
          district: districtList,
          districtModel: districtList.first,
          municipality: municipalityList,
          municipalityModel: municipalityList.first,
        ));
      } catch (e) {
        showErrorSnackBar(
          state.ctx!,
          'Couldnot load district and municipality',
        );
        emit(state.copyWith(
          loading: false,
        ));
      }
    }
  }

  getMunicipality(int districtId) async {
    if (state.ctx != null) {
      try {
        emit(state.copyWith(
          loading: true,
        ));
        List<MunicipalityModel> municipalityList =
            await OnlineTicketMediflowRepo.getMunicipality(districtId);
        emit(state.copyWith(
          loading: false,
          municipality: municipalityList,
          municipalityModel: municipalityList.first,
        ));
      } catch (e) {
        showErrorSnackBar(state.ctx!, 'Could not load municipality');
        emit(state.copyWith(
          loading: false,
        ));
      }
    }
  }

  changeAgeLabelOne(String ageLabel) {
    int indexOne = kAgeOneList.indexOf(ageLabel);
    emit(state.copyWith(
      ageLabelOne: ageLabel,
      ageLabelTwo: kAgeTwoList[indexOne],
    ));
  }

  changeAgeLabelTwo(String ageLabel) {
    emit(state.copyWith(
      ageLabelTwo: ageLabel,
    ));
  }

  changeDistrict(DistrictModel districtModel) {
    emit(state.copyWith(
      districtModel: districtModel,
    ));
    getMunicipality(districtModel.id);
  }

  changeMunicipality(MunicipalityModel municipalityModel) {
    emit(state.copyWith(
      municipalityModel: municipalityModel,
    ));
  }

  changeGender(String gender) {
    emit(state.copyWith(
      gender: gender,
    ));
  }

  changeFname(String fname) {
    emit(state.copyWith(
      fname: fname,
    ));
  }

  changeLname(String lname) {
    emit(state.copyWith(
      lname: lname,
    ));
  }

  changeAgeOne(String ageOne) {
    int value = ageOne == '' ? 0 : int.parse(ageOne);
    emit(state.copyWith(
      ageOne: value,
    ));
  }

  changeAgeTwo(String ageTwo) {
    int value = ageTwo == '' ? 0 : int.parse(ageTwo);
    emit(state.copyWith(
      ageTwo: value,
    ));
  }

  changePhone(String phone) {
    emit(state.copyWith(
      phoneNumber: phone,
    ));
  }

  changeWard(String ward) {
    int value = ward == '' ? 0 : int.parse(ward);
    emit(state.copyWith(
      ward: value,
    ));
  }

  changePolicyNumber(String policynumber) {
    emit(state.copyWith(
      policynumber: policynumber,
    ));
  }

  getInsureeDetail() async {
    // if empty return and show message
    if (state.policynumber.isEmpty) {
      if (state.ctx != null) {
        showErrorSnackBar(
          state.ctx!,
          'Enter policy number first',
        );
      }
      return;
    }
    try {
      emit(state.copyWith(
        loading: true,
        insureeFetched: false,
      ));
      InsureeDetailModel? insureeDetailModel =
          await OnlineTicketMediflowRepo.getInsureeDetail(
              state.policynumber, state.billingModeModel.name);
      if (insureeDetailModel != null) {
        emit(state.copyWith(
          gender: insureeDetailModel.gender,
          ageOne: int.parse(insureeDetailModel.age),
          ageLabelOne: 'Years',
          ageTwo: 0,
          fname: insureeDetailModel.fname,
          lname: insureeDetailModel.lname,
          insureeDetailModel: insureeDetailModel,
          loading: false,
          insureeFetched: true,
        ));
      } else {
        emit(state.copyWith(
          loading: false,
          insureeFetched: false,
        ));
      }
    } catch (e) {
      if (state.ctx != null) {
        showErrorSnackBar(
          state.ctx!,
          'Policy number is not correct',
        );
      }
      emit(state.copyWith(
        loading: false,
        insureeFetched: false,
      ));
    }
  }

  resetInsureeDetail() {
    emit(state.copyWith(
      insureeDetailModel: null,
      fname: '',
      lname: '',
      ageOne: 0,
      ageTwo: 0,
      gender: kGenderList.first,
    ));
  }
}
