import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/const/consts.dart';
import '../../../data/model/chart_data.dart';
import '../../bloc/admin_dashboard_bloc/admin_dashboard_export.dart';
import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/google_map.dart';
import '../../widgets/widgets.dart';

class AdminDashboardTabMob extends StatefulWidget {
  const AdminDashboardTabMob({super.key});

  @override
  State<AdminDashboardTabMob> createState() => _AdminDashboardTabMobState();
}

class _AdminDashboardTabMobState extends State<AdminDashboardTabMob> {


  List<String> data = [];
  int? drawerIndex;
  String? selectVal;
  String? selectedValue;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.9355697, 76.9771837),
    zoom: 18,
  );

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    drawerIndex = 0;
    selectVal = 'Home';

    // context.read<AdminDashboardBloc>().add(DraweDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminDashboardBloc, AdminDashboardState>(

      listener: (context, state) {
        if (state is DrawerData) {
          print("data is here${state.data}");
          data = state.data;
        } else if (state is DrawerPositionState) {
          print('changed: ${state.clickedPos}');
          drawerIndex = state.clickedPos;
          selectVal = state.selectValue;
          print('changed pos: ${drawerIndex}');
          print('changed val: ${selectVal}');
        } else if (state is AdminDashboardInitial) {
          print('change initial');
        }else if (state is DropSelectValState) {
          print('dropval: ${state.selectVal}');
          selectedValue=state.selectVal;
        }
      },
      child: BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: StringValues.adminDashboard,
              titleStyle: CustomTextStyles.appbarTextStyle,
              subTitle: selectVal!,
              backgroundColor: CustomAppColors.sidebarColor,
              leading: BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
                builder: (context, state) {
                  return InkWell(
                      onTap: () {
                        print('pos : $drawerIndex');
                        context.read<AdminDashboardBloc>().add(ToggleDrawer());
                        Scaffold.of(context).openDrawer();
                      },
                      child: Icon(
                        GlobalIcons.menu, color: CustomAppColors.white,));
                },
              ),),
            drawer: GlobalDrawer(drawerData: data, onItemPosition: (position) {
              print('position is here: $position');
            }, position: drawerIndex!,),
            body: drawerIndex==2?Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GlobalGoogleMapWidget(
                    position: _kGooglePlex,
                    competeController: _controller),
              ),
            ) : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomCard(
                            title: '10,253',subTitle: 'This month orders',iconData: GlobalIcons.people,
                            percentage: 65,progressColor: CustomAppColors.progressGreenColor,
                          ),

                        ),
                        Expanded(child: CustomCard(title: '1,23,455',subTitle: 'Last Months Orders',
                          iconData: GlobalIcons.views,percentage: 88,progressColor:CustomAppColors.progressOrangeColor ,)),
                        // Expanded(child: CustomCard(title: '10,55,467',subTitle: 'Last Month Revenue',
                        //   iconData: GlobalIcons.cart,percentage: 90,progressColor: CustomAppColors.progressBlueColor,)),
                        // Expanded(child: CustomCard(title: '1,750',subTitle: 'New Messages',
                        //   iconData: GlobalIcons.messages,percentage: 30,progressColor: CustomAppColors.progressRedColor,))
                      ],
                    ),
                    Text(StringValues.dropDownString),
                    GlobalDropdownWidget(items: ['One','Two','Three'], selectedValue: selectedValue),
                    const Divider(),
                    Text(StringValues.customDataTable),
                    CustomDataTable(),
                    const Divider(),
                    Text(StringValues.dashboardChartData),
                    Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.white ,
                          child: CustomChart(data: [ ChartData('SEPTEMBER', 60),
                            ChartData('OCTOBER', 70),
                            ChartData('NOVEMBER', 72),
                            ChartData('DECEMBER', 65),
                            ChartData('JANUARY', 90)],),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.white ,
                          child: CustomChart(data: [ ChartData('SEPTEMBER', 60),
                            ChartData('OCTOBER', 70),
                            ChartData('NOVEMBER', 72),
                            ChartData('DECEMBER', 65),
                            ChartData('JANUARY', 90)],),
                        )),

                    Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.white ,
                          child: CustomChart(data: [ ChartData('SEPTEMBER', 60),
                            ChartData('OCTOBER', 70),
                            ChartData('NOVEMBER', 72),
                            ChartData('DECEMBER', 65),
                            ChartData('JANUARY', 90)],),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
