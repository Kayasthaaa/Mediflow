import 'package:flutter/material.dart';
import 'package:mediflow_bloc/bottomnavigation.dart';
import 'package:mediflow_bloc/screens/DashBoard.dart';
import 'package:mediflow_bloc/screens/DoctorRelated/doctorProfileDetails.dart';
import 'package:mediflow_bloc/screens/Utilities/BMICalculators/bmiTabBar.dart';
import 'package:mediflow_bloc/screens/Utilities/EddCalculator.dart';
import 'package:mediflow_bloc/screens/DoctorRelated/doctorLogin.dart';
import 'package:mediflow_bloc/screens/online_ticket_screen/online_ticket_all_doctor/online_ticket_all_company/online_ticket_all_company.dart';
import 'package:mediflow_bloc/screens/online_ticket_screen/online_ticket_all_doctor/online_ticket_all_department/online_ticket_all_department.dart';
import 'package:mediflow_bloc/screens/online_ticket_screen/online_ticket_all_doctor/online_ticket_all_doctor.dart';
import 'package:mediflow_bloc/screens/online_ticket_screen/online_ticket_department/online_ticket_department.dart';
import 'package:mediflow_bloc/screens/online_ticket_screen/online_ticket_detail/online_ticket_detail.dart';
import 'package:mediflow_bloc/screens/online_ticket_screen/online_ticket_doctor/online_ticket_doctor.dart';
import 'package:mediflow_bloc/screens/online_ticket_screen/online_ticket_hospital/online_ticket_hospital.dart';
import 'package:mediflow_bloc/screens/online_ticket_screen/online_ticket_payment/online_ticket_payment.dart';
import 'package:mediflow_bloc/screens/online_ticket_screen/online_ticket_schedule/online_ticket_schedule.dart';
import 'package:mediflow_bloc/screens/online_ticket_screen/online_ticket_screen.dart';
import 'package:mediflow_bloc/screens/PatientLogins/patientLogin.dart';
import 'package:mediflow_bloc/screens/PatientLogins/patientRegister.dart';
import 'package:mediflow_bloc/screens/ProfileDetails/profileDashboard.dart';
import 'package:mediflow_bloc/screens/startappChoose.dart';
import '../screens/ProfileDetails/userProfile.dart';
import '../screens/TransactionDetails.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const ChooseLogin(),
        );

      case '/online-ticket-screen':
        return MaterialPageRoute(
          builder: (context) => const OnlineTicketScreen(),
        );
      case '/online-ticket-hospital':
        return MaterialPageRoute(
          builder: (context) => const OnlineTicketHospital(),
        );
      case '/online-ticket-department':
        return MaterialPageRoute(
          builder: (context) => const OnlineTicketDepartment(),
        );
      case '/online-ticket-doctor':
        return MaterialPageRoute(
          builder: (context) => const OnlineTicketDoctor(),
        );
      case '/online-ticket-schedule':
        return MaterialPageRoute(
          builder: (context) => const OnlineTicketSchedule(),
        );
      case '/online-ticket-detail':
        return MaterialPageRoute(
          builder: (context) => const OnlineTicketDetail(),
        );
      case '/online-ticket-all-doctor':
        return MaterialPageRoute(
          builder: (context) => const OnlineTicketAllDoctor(),
        );
      case '/online-ticket-payment':
        return MaterialPageRoute(
          builder: (context) => const OnlineTicketPayment(),
        );
      case '/online-ticket-all-company-for-doctor':
        return MaterialPageRoute(
          builder: (context) => const OnlineTicketAllCompany(),
        );
      case '/online-ticket-all-department-for-doctor':
        return MaterialPageRoute(
          builder: (context) => const OnlineTicketAllDepartment(),
        );
      case '/profile-dashboard':
        return MaterialPageRoute(
          builder: (context) => const ProfileDashboard(),
        );
      case '/landing-dashboard':
        return MaterialPageRoute(
          builder: (context) => const Dashboard(),
        );
      case '/bottom-navigation':
        return MaterialPageRoute(
          builder: (context) => const BottomNavigation(),
        );
      case '/patient-login':
        return MaterialPageRoute(
          builder: (context) => const PatientLogin(),
        );
      case '/patient-register':
        return MaterialPageRoute(
          builder: (context) => const PatientRegister(),
        );
      case '/doctor-login':
        return MaterialPageRoute(
          builder: (context) => const DoctorLogin(),
        );
      case '/edd-calculator':
        return MaterialPageRoute(
          builder: (context) => const Edd(),
        );
      case '/bmi-calculator':
        return MaterialPageRoute(
          builder: (context) => const tabBarBmi(),
        );
      case '/user-profile-details':
        return MaterialPageRoute(
          builder: (context) => const UserProfile(),
        );
      case '/doctor-profile-details':
        return MaterialPageRoute(
          builder: (context) => const DoctorProfile(),
        );
      case '/user-transaction-details':
        return MaterialPageRoute(
          builder: (context) => const TransactionDetails(),
        );
      default:
        return null;
    }
  }
}
