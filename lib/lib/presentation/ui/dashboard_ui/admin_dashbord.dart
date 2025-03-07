
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/admin_dashboard_bloc/admin_dashboard_export.dart';
import '../../widgets/appbar/custom_appbar_web.dart';
import '../../widgets/widgets.dart';
import 'admin_dashboard_tab_mob.dart';
import 'admin_dashboard_web.dart';

class AdminDashbord extends StatefulWidget {
  const AdminDashbord({super.key});

  @override
  State<AdminDashbord> createState() => _AdminDashbordState();
}

class _AdminDashbordState extends State<AdminDashbord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: kIsWeb ?null:
      // // CustomAppBarWeb(title: StringValues.adminDashboard,
      // //   backgroundColor: CustomAppColors.appbarColor,
      // // leading: Icon(GlobalIcons.menu),) :
      // CustomAppBar(title: StringValues.adminDashboard,
      //   backgroundColor: CustomAppColors.appbarColor,
      //   leading: BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
      //     builder: (context, state) {
      //       return InkWell(
      //         onTap: (){
      //           context.read<AdminDashboardBloc>().add(ToggleDrawer());
      //           Scaffold.of(context).openDrawer();
      //         },
      //           child: Icon(GlobalIcons.menu));
      //     },
      //   ),),
     // drawer:kIsWeb ? null:GlobalDrawer(drawerData: drawerData),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return AdminDashboardTabMob();
          } else if (constraints.maxWidth > 600 && constraints.maxWidth < 900) {
            return AdminDashboardTabMob();
          } else {
            return  AdminDashboardWeb();
          }
        },
      ),
    );
  }
}
