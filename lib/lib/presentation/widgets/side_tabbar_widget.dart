import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/const/consts.dart';
import '../bloc/admin_dashboard_bloc/admin_dashboard_export.dart';

class SideTabBarWidget extends StatelessWidget {
   const SideTabBarWidget({super.key,required this.index});
    final  int index;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
      builder: (context, state) {
        return Container(
          width: 150, // Sidebar width
          color: CustomAppColors.sidebarColor,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Image.asset(AssetConst.appLogo, height: 55,),
              const Divider(color: Colors.white),

              // Vertical TabBar
              Expanded(
                child: ListView(
                  children: [
                    _buildTabItem(context, 0, Icons.home, "Home", index),
                    _buildTabItem(context, 1, Icons.person, "Profile", index),
                    _buildTabItem(context, 2, Icons.settings, "Settings", index),
                    _buildTabItem(context, 3, Icons.map_outlined, "Google Map", index),
                    _buildTabItem(context, 4, Icons.chat_sharp, "Chats", index),
                    _buildTabItem(context, 5, Icons.logout, "Logout", index),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabItem(BuildContext context, int index, IconData icon,
      String title, int selectedIndex) {
    return ListTile(
      leading: Icon(
          icon, color: selectedIndex == index ? Colors.white : Colors.grey),
      title: Text(title, style: TextStyle(
          color: selectedIndex == index ? Colors.white : Colors.grey)),
      selected: selectedIndex == index,
      onTap: () =>
          context.read<AdminDashboardBloc>().add(
              ChangeSidebarItemEvent(index)),
    );
  }
}
