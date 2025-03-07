
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lib/core/config/env_loader.dart';
import 'lib/core/routes/routes.dart';
import 'lib/presentation/bloc/admin_dashboard_bloc/admin_dashboard_export.dart';
import 'lib/presentation/bloc/login_bloc/login_export.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EnvLoader.loadEnv(); // Load .env file

  print("Base URL: ${EnvLoader.get('BASE_URL')}"); // Debugging
  print("isweb: ${kIsWeb}"); // Debugging

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => LoginBloc()),
        BlocProvider(create: (context)=> AdminDashboardBloc()..add(DraweDataEvent()))

      ],

      child: MaterialApp(
        initialRoute: Routes.adminDashboard,
        routes: Routes.getRoutes(),
        //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}