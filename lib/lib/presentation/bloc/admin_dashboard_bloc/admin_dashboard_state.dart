


import 'dart:ui';

import '../../../data/model/chat_user_model/chat_users_model.dart';



abstract class AdminDashboardState {
  const AdminDashboardState();
}

 class AdminDashboardInitial extends AdminDashboardState {
  AdminDashboardInitial();
}

class DrawerData  extends AdminDashboardState{
  final List<String> data;

  DrawerData({required this.data});
}

class DrawerOpened extends AdminDashboardState {
  DrawerOpened();
}

class DrawerClosed extends AdminDashboardState {
  DrawerClosed();
}

class TabBarIndexState extends AdminDashboardState{

  final int selectedIndex;
  TabBarIndexState({required this.selectedIndex});

}

class DrawerPositionState extends AdminDashboardState{
  final Offset  position;
  final int clickedPos;
  final String selectValue;

  DrawerPositionState({required this.position,required this.clickedPos, required this.selectValue});
}


class ChatUserListState extends AdminDashboardState{
  final List<ChatUsersComponents> chatUsersComponents;
  ChatUserListState({required this.chatUsersComponents});
}


class DropSelectValState extends AdminDashboardState{
  final String? selectVal;

  DropSelectValState({required this.selectVal});
}