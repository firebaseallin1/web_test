
import 'package:flutter/material.dart';

import '../../presentation/ui/screens.dart';



abstract class Routes {

  static const String splashScreen = '/splash_screen';
  static const String loginScreen = '/login_screen';
  static const String adminDashboard = '/admin_dashboard_screen';



  static Map<String, WidgetBuilder> getRoutes() {
    return {

      loginScreen: (context) => const LoginScreen(),
      adminDashboard: (context) => const AdminDashbord(),

    };

  }


}