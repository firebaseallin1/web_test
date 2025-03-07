import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/const/consts.dart';
import '../../../core/const/custom_colors.dart';
import '../../../data/model/chart_data.dart';
import '../../bloc/admin_dashboard_bloc/admin_dashboard_export.dart';
import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_column_chart_widget.dart';
import '../../widgets/custom_data_table_widget.dart';
import '../../widgets/google_map.dart';
import '../../widgets/side_tabbar_widget.dart';

class AdminDashboardWeb extends StatefulWidget {
  const AdminDashboardWeb({super.key});

  @override
  State<AdminDashboardWeb> createState() => _AdminDashboardWebState();
}

class _AdminDashboardWebState extends State<AdminDashboardWeb> {
  int index=0;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.9355697, 76.9771837),
    zoom: 18,
  );

  final Completer<GoogleMapController> _controller =
    Completer<GoogleMapController>();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
      builder: (context, state) {
        return BlocListener<AdminDashboardBloc, AdminDashboardState>(
          listener: (context, state) {
            if(state is TabBarIndexState){
              print("selectedTab ${state.selectedIndex}");
              index=state.selectedIndex;
              if(index==4){
                context.read<AdminDashboardBloc>().add(ChatUserListEvent());
              }
            }else if(state is ChatUserListState){
              print("userListlenth: ${state.chatUsersComponents.length}");
            }
          },
          child: Row(
            children: [
              Expanded(
                  child: SideTabBarWidget(index: index,)),
              Expanded(
                  flex: 5,
                  child: Scaffold(
                    // appBar: PreferredSize(
                    //   preferredSize: Size.fromHeight(78),
                    //     child: Center(
                    //       child: CustomAppBarWeb(title: StringValues.adminDashboard,
                    //         actions: [
                    //           Padding(
                    //             padding: const EdgeInsets.only(right: 8.0),
                    //             child: Icon(GlobalIcons.notifications),
                    //           ),
                    //
                    //           Padding(
                    //             padding: const EdgeInsets.only(right: 8.0),
                    //             child: Icon(GlobalIcons.profile),
                    //           ),
                    //         ],),
                    //     )),
                    body:
                        index==3?Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GlobalGoogleMapWidget(
                                position: _kGooglePlex,
                                competeController: _controller),
                          ),
                        ) : index==4?
                              BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
                                  builder: (context, state) {
                                    return Container(
                                              width: MediaQuery.of(context).size.width,
                                              height: MediaQuery.of(context).size.height,
                                              child:
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                        color: Colors.purple,)),
                
                                                  Expanded(
                                                    flex: 2,
                                                      child: Container(
                                                        color: Colors.blue,
                                                      )),
                                                ],
                                              ),
                                            );
                                  },
                                )
                              :Container(
                      color: CustomAppColors.colorGrey,
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                  Expanded(child: CustomCard(title: '10,55,467',subTitle: 'Last Month Revenue',
                                    iconData: GlobalIcons.cart,percentage: 90,progressColor: CustomAppColors.progressBlueColor,)),
                                  Expanded(child: CustomCard(title: '1,750',subTitle: 'New Messages',
                                    iconData: GlobalIcons.messages,percentage: 30,progressColor: CustomAppColors.progressRedColor,))
                                ],
                              ),
                              SizedBox(height: 25,),
                              Text('Last 5 Months Orders Details',style: TextStyle(fontSize: 20),),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [

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
                                  SizedBox(width: 25,),
                                  Expanded(
                                    flex: 2,
                                      child: Container())
                                ],
                              ),

                              SizedBox(height: 25,),

                              Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: CustomDataTable()),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
