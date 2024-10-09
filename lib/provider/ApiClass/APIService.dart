import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mediflow_bloc/Models/ModelClass.dart';
import 'package:mediflow_bloc/constant/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

// this is API class for global token generation when app starts.

class GlobalToken {
  globalTokenGeneration() async {
    try {
      final uri = Uri.parse('${appUrl}api/Token/Login');
      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        'username': 'mediflow',
        'password': 'medi@1234'
      };
      String jsonBody = json.encode(body);
      final encoding = Encoding.getByName('utf-8');
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );
      print(response.statusCode);
      var responseJson = jsonDecode(response.body.toString());
      AppBeginToken responseModel = AppBeginToken.fromJson(responseJson);
      String token = responseModel.token.toString();
      print('Here is token global:$token'); // This is Global token

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      await sharedPreferences.setString("token", token);
      var globalToken = sharedPreferences.getString("token");
      print("$globalToken");
    } catch (e) {
      print(e);
    }
  }
}

class ApiService extends ChangeNotifier {
  PatientsResponseLoginModels? patientData;
  DoctorResponseLoginModels? doctorData;
  Transactions? transactions;

  String url = "${appUrl}api/PatientMaster/PostPatientLogin";

  disposeValuesProviders() {
    patientData = null;
    doctorData = null;
    notifyListeners();
  }

// this is API class for patient login
  patientLogin(PatientsRequestLoginModels patientsRequestLoginModels) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var globalToken = sharedPreferences.getString("token");
      print("$globalToken");

      http.Response patientResponse = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': 'Bearer $globalToken',
          },
          body: jsonEncode(
            patientsRequestLoginModels,
          ));
      var jsonResponsePatient = json.decode(patientResponse.body
          .toString()); // here jsonResponsePatient is a variable assigned which contains response from api
      PatientsResponseLoginModels responseModelPatients =
          PatientsResponseLoginModels.fromJson(jsonResponsePatient);
      patientData = responseModelPatients;
      String UserTokenPatient = responseModelPatients.token.toString();
      notifyListeners();

      sharedPreferences.setString(
          "UserId", responseModelPatients.cemRno.toString());

      sharedPreferences.setInt("patientCode", patientResponse.statusCode);

      sharedPreferences.setString("userTokenPatient", UserTokenPatient);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

// from this is API class for doctor login

  Future<DoctorResponseLoginModels> register(
      DoctorRequestLoginModels doctorLoginRequestModels) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var globalToken = sharedPreferences.getString("token");
      print("$globalToken");

      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': 'Bearer $globalToken',
          },
          body: jsonEncode(doctorLoginRequestModels));

      var responseJson = json.decode(response.body.toString());
      // var responseJson = json.decode(response.b.toString());
      print('res $responseJson');
      DoctorResponseLoginModels responseModel =
          DoctorResponseLoginModels.fromJson(responseJson);
      doctorData = responseModel;

      String UserTokenDoctor = responseModel.token.toString();
      notifyListeners();
      print("This is noy $responseModel");
      print(response.statusCode);
      print("this is war ${UserTokenDoctor.toString()}");
      sharedPreferences.setInt("code", response.statusCode);

      sharedPreferences.setString("userTokenDoctor", UserTokenDoctor);
      var getDoctorToken = sharedPreferences.getString("userTokenDoctor");
      print("This contains: $getDoctorToken");
      return DoctorResponseLoginModels.fromJson(jsonDecode(response.body));
      // return DoctorResponseLoginModels.fromJson(jsonDecode(response.data));
    } catch (e) {
      print(e);
      rethrow;
    }
  }

// this is api class for patinet registration

  Future<dynamic> patientNewRegister(
      NewPatientRegister newPatientRegister) async {
    String url = "${appUrl}api/PatientMaster/PostPatientRegister";
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var globalToken = sharedPreferences.getString("token");

      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': 'Bearer $globalToken',
          },
          body: jsonEncode(newPatientRegister));

      var responseJson = jsonDecode(response.body.toString());
      Data responseModel = Data.fromJson(responseJson);
      String token = responseModel.cemRno.toString();
      print('Here is token:$responseJson'); // This is in Json format
      var resp = PatientResponse.fromJson(responseJson);

      notifyListeners();

      return responseJson;
    } catch (e) {
      print(e);
    }
  }
}

// this is api class for transactions

class ApiTransactions extends ChangeNotifier {
  Transactions? transactionsHistory;
  Future<Transactions> fetchTransactions() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var globalToken = sharedPreferences.getString("token");
      var getUserId = sharedPreferences.getString("UserId");
      Response response = await http.get(
        Uri.parse("${transactionUrl}api/AllGateway/TransactionList/$getUserId"),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalToken',
        },
      );
      if (response.statusCode == 200) {
        var respTransaction =
            Transactions.fromJson(json.decode(response.body.toString()));
        transactionsHistory = respTransaction;
        notifyListeners();
        return respTransaction;
      } else {
        throw Exception("Failed to load Transacitions");
      }
    } catch (e) {
      rethrow;
    }
  }
}
