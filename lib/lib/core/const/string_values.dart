
import 'package:flutter/material.dart';

import '../config/env_loader.dart';

class StringValues{

   static String baseUrl= EnvLoader.get('BASE_URL').toString();

  static const String appBarText='DashBard';
  static const String saveButtonText='SAVE';
  static const String cancelButtonText='CANCEL';
  static const String noData='NoData';
  static const String noInternet='No Internet Connection';
  static const String version='App Version Mismatch';


  static var apiHeader = {"Content-Type": "application/json"};

  //TODO: LOGIN SCREEN STRING VALUES

  //Login user id text values
  static const String loginUserID='UserID';
  static const String txt_loginUserID='Enter UserID';
  // Login password text values
  static const String loginPassword='Password';
  static const String txt_LoginPassword='Enter Password';

  static const String forgetPassword='Forgot Password?';
  static const String login='Login';
  static const String dropDownString='DropDown Button';
  static const String customDataTable='Data Table';
  static const String dashboardChartData='Chart Data';


  static const double inputTextSizedHeight=75;


  // APPBAR TEXT VALUES

  static const String adminDashboard='Admin DashBoard';

  static List<DataColumn> dataTableColumnValues=[
     DataColumn(label: Text('S.No')),
     DataColumn(label: Text('Order ID')),
     DataColumn(label: Text('Customer Name')),
     DataColumn(label: Text('Count')),
     DataColumn(label: Text('Amount')),
  ];


  static List<DataCell> dataTableDataRows=[
    DataCell(Text('1')),
    DataCell(Text('100001')),
    DataCell(Text('Ram')),
    DataCell(Text('15')),
    DataCell(Text('1500.00')),


  ];



}