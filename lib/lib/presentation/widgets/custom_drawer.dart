import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/const/consts.dart';
import '../bloc/admin_dashboard_bloc/admin_dashboard_bloc.dart';
import '../bloc/admin_dashboard_bloc/admin_dashboard_event.dart';

class GlobalDrawer extends StatelessWidget {

   GlobalDrawer({super.key, required this.drawerData, required this.onItemPosition, required this.position});

  final List<String> drawerData;
  final GlobalKey _itemKey= GlobalKey();
   final Function(Offset) onItemPosition;
   final int position;



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 150,// Sidebar width
              color: CustomAppColors.sidebarColor,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(AssetConst.appLogo, height: 55,),
              )),
          Expanded(
            child: ListView.builder(
              itemCount: drawerData.length,
              key: _itemKey,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    listData(context,index),
                    Divider()
                  ],
                );
              },
            ),
          ),
          Divider()
        ],
      ),
    );
  }


  Card listData(BuildContext context,index){

    print("in pos: $position");

    return Card(
      color: index==position? CustomAppColors.sidebarColor:CustomAppColors.colorGrey,
      elevation: 12,
      child: ListTile(
        title: Text(drawerData[index],
          style:index==position? CustomTextStyles.drawerEnableTextStyle:CustomTextStyles.drawerDisableTextStyle,),

        onTap: () {
          print('drawer index: $index' );
          Navigator.pop(context);
          _getPosition(context,index,drawerData[index]);

        },
        leading: Icon(GlobalIcons.profile),iconColor:index==position?CustomAppColors.white:CustomAppColors.black,
      ),
    );
  }


   void _getPosition(BuildContext context, int pos, String selectVal) {
    print('its work');
     WidgetsBinding.instance.addPostFrameCallback((_) {
       final RenderBox? renderBox =
       _itemKey.currentContext?.findRenderObject() as RenderBox?;

       print('chack ${_itemKey.currentContext}');

       if (renderBox != null) {
         final position = renderBox.localToGlobal(Offset.zero);

         // Dispatch event to BLoC
         context.read<AdminDashboardBloc>().add(DrawerPositionEvent(pos: position,clickedPos: pos,selectedValue: selectVal));
       }
     });
   }


}
