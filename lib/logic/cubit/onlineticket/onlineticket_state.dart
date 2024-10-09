// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'onlineticket_cubit.dart';

class OnlineticketState extends Equatable {
  final BuildContext? ctx;
  final bool loading;
  final int companyId;
  final int departmentId;
  final BillingModeModel billingModeModel;
  final DoctorModel doctorModel;
  final ScheduleModel scheduleModel;
  final String gender;
  final List<HospitalModel> hospitalList;
  final List<HospitalModel> hospitalSearchList;
  final List<HospitalModel> hospitalListForDoctor;
  final List<HospitalModel> hospitalSearchListForDoctor;
  final List<DepartmentModel> departmentListForDoctor;
  final List<DepartmentModel> departmentSearchListForDoctor;
  final List<BillingModeModel> billingModeList;
  final List<DepartmentModel> departmentList;
  final List<DepartmentModel> departmentSearchList;
  final List<DoctorModel> doctorList;
  final List<DoctorModel> doctorSearchList;
  final List<DoctorModel> allDoctorList;
  final List<DoctorModel> allDoctorSearchList;
  final List<ScheduleModel> scheduleList;
  final List<DistrictModel> district;
  final List<MunicipalityModel> municipality;
  final DistrictModel districtModel;
  final MunicipalityModel municipalityModel;
  final String ageLabelOne;
  final String ageLabelTwo;
  final String fname;
  final String lname;
  final int ageOne;
  final int ageTwo;
  final String phoneNumber;
  final int ward;
  final String policynumber;
  final InsureeDetailModel insureeDetailModel;
  final bool insureeFetched;
  final List<String> availableTime;
  final String selectedTime;
  final bool allDoctorMode;
  const OnlineticketState({
    this.ctx,
    this.loading = false,
    this.companyId = 0,
    this.departmentId = 0,
    required this.billingModeModel,
    required this.doctorModel,
    required this.scheduleModel,
    required this.gender,
    required this.hospitalList,
    required this.hospitalSearchList,
    required this.hospitalListForDoctor,
    required this.hospitalSearchListForDoctor,
    required this.departmentListForDoctor,
    required this.departmentSearchListForDoctor,
    required this.billingModeList,
    required this.departmentList,
    required this.departmentSearchList,
    required this.doctorList,
    required this.doctorSearchList,
    required this.allDoctorList,
    required this.allDoctorSearchList,
    required this.scheduleList,
    required this.district,
    required this.municipality,
    required this.districtModel,
    required this.municipalityModel,
    required this.ageLabelOne,
    required this.ageLabelTwo,
    this.fname = '',
    this.lname = '',
    this.ageOne = 0,
    this.ageTwo = 0,
    this.phoneNumber = '',
    this.ward = 0,
    this.policynumber = '',
    required this.insureeDetailModel,
    this.insureeFetched = false,
    required this.availableTime,
    this.selectedTime = '',
    this.allDoctorMode = false,
  });

  @override
  List<Object> get props => [
        loading,
        companyId,
        departmentId,
        doctorModel,
        billingModeModel,
        scheduleModel,
        gender,
        hospitalList,
        billingModeList,
        hospitalSearchList,
        departmentList,
        departmentSearchList,
        doctorList,
        doctorSearchList,
        allDoctorList,
        allDoctorSearchList,
        scheduleList,
        district,
        municipality,
        districtModel,
        municipalityModel,
        ageLabelOne,
        ageLabelTwo,
        ageOne,
        ageTwo,
        phoneNumber,
        ward,
        policynumber,
        insureeDetailModel,
        insureeFetched,
        hospitalListForDoctor,
        hospitalSearchListForDoctor,
        availableTime,
        selectedTime,
        departmentListForDoctor,
        departmentSearchListForDoctor,
        allDoctorMode,
      ];

  OnlineticketState copyWith({
    BuildContext? ctx,
    bool? loading,
    int? companyId,
    int? departmentId,
    BillingModeModel? billingModeModel,
    DoctorModel? doctorModel,
    ScheduleModel? scheduleModel,
    String? gender,
    List<HospitalModel>? hospitalList,
    List<HospitalModel>? hospitalSearchList,
    List<HospitalModel>? hospitalListForDoctor,
    List<HospitalModel>? hospitalSearchListForDoctor,
    List<DepartmentModel>? departmentListForDoctor,
    List<DepartmentModel>? departmentSearchListForDoctor,
    List<BillingModeModel>? billingModeList,
    List<DepartmentModel>? departmentList,
    List<DepartmentModel>? departmentSearchList,
    List<DoctorModel>? doctorList,
    List<DoctorModel>? doctorSearchList,
    List<DoctorModel>? allDoctorList,
    List<DoctorModel>? allDoctorSearchList,
    List<ScheduleModel>? scheduleList,
    List<DistrictModel>? district,
    List<MunicipalityModel>? municipality,
    DistrictModel? districtModel,
    MunicipalityModel? municipalityModel,
    String? ageLabelOne,
    String? ageLabelTwo,
    String? fname,
    String? lname,
    int? ageOne,
    int? ageTwo,
    String? phoneNumber,
    int? ward,
    String? policynumber,
    InsureeDetailModel? insureeDetailModel,
    bool? insureeFetched,
    List<String>? availableTime,
    String? selectedTime,
    bool? allDoctorMode,
  }) {
    return OnlineticketState(
      ctx: ctx ?? this.ctx,
      loading: loading ?? this.loading,
      companyId: companyId ?? this.companyId,
      departmentId: departmentId ?? this.departmentId,
      billingModeModel: billingModeModel ?? this.billingModeModel,
      doctorModel: doctorModel ?? this.doctorModel,
      scheduleModel: scheduleModel ?? this.scheduleModel,
      gender: gender ?? this.gender,
      hospitalList: hospitalList ?? this.hospitalList,
      hospitalSearchList: hospitalSearchList ?? this.hospitalSearchList,
      hospitalListForDoctor:
          hospitalListForDoctor ?? this.hospitalListForDoctor,
      hospitalSearchListForDoctor:
          hospitalSearchListForDoctor ?? this.hospitalSearchListForDoctor,
      departmentListForDoctor:
          departmentListForDoctor ?? this.departmentListForDoctor,
      departmentSearchListForDoctor:
          departmentSearchListForDoctor ?? this.departmentSearchListForDoctor,
      billingModeList: billingModeList ?? this.billingModeList,
      departmentList: departmentList ?? this.departmentList,
      departmentSearchList: departmentSearchList ?? this.departmentSearchList,
      doctorList: doctorList ?? this.doctorList,
      doctorSearchList: doctorSearchList ?? this.doctorSearchList,
      allDoctorList: allDoctorList ?? this.allDoctorList,
      allDoctorSearchList: allDoctorSearchList ?? this.allDoctorSearchList,
      scheduleList: scheduleList ?? this.scheduleList,
      district: district ?? this.district,
      municipality: municipality ?? this.municipality,
      districtModel: districtModel ?? this.districtModel,
      municipalityModel: municipalityModel ?? this.municipalityModel,
      ageLabelOne: ageLabelOne ?? this.ageLabelOne,
      ageLabelTwo: ageLabelTwo ?? this.ageLabelTwo,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      ageOne: ageOne ?? this.ageOne,
      ageTwo: ageTwo ?? this.ageTwo,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      ward: ward ?? this.ward,
      policynumber: policynumber ?? this.policynumber,
      insureeDetailModel: insureeDetailModel ?? this.insureeDetailModel,
      insureeFetched: insureeFetched ?? this.insureeFetched,
      availableTime: availableTime ?? this.availableTime,
      selectedTime: selectedTime ?? this.selectedTime,
      allDoctorMode: allDoctorMode ?? this.allDoctorMode,
    );
  }
}

class OnlineticketInitial extends OnlineticketState {
  OnlineticketInitial()
      : super(
          billingModeModel:
              BillingModeModel(id: 0, name: '', showPolicyNumber: false),
          scheduleModel:
              ScheduleModel(id: 0, date: DateTime.now(), quota: 0, planId: 0),
          gender: kGenderList[0],
          hospitalList: [],
          hospitalSearchList: [],
          departmentList: [],
          billingModeList: [],
          departmentSearchList: [],
          doctorList: [],
          doctorSearchList: [],
          allDoctorList: [],
          allDoctorSearchList: [],
          doctorModel: DoctorModel(id: 0, name: '', post: '', estimatedTime: 0),
          scheduleList: [],
          district: [],
          municipality: [],
          districtModel: DistrictModel(id: 0, name: ''),
          municipalityModel: MunicipalityModel(id: 0, name: ''),
          ageLabelOne: kAgeOneList.first,
          ageLabelTwo: kAgeTwoList.first,
          insureeDetailModel:
              InsureeDetailModel(fname: '', lname: '', gender: '', age: '0'),
          hospitalListForDoctor: [],
          hospitalSearchListForDoctor: [],
          availableTime: [],
          departmentListForDoctor: [],
          departmentSearchListForDoctor: [],
        );
}
