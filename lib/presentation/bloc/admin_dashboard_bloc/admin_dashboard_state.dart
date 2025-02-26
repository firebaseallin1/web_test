


import 'package:allinone/data/model/chat_user_model/chat_users_model.dart';
import 'package:allinone/data/model/user_model/user_raw_model.dart';

abstract class AdminDashboardState {
  const AdminDashboardState();
}

final class AdminDashboardInitial extends AdminDashboardState {
  AdminDashboardInitial();
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


class ChatUserListState extends AdminDashboardState{
  final List<ChatUsersComponents> chatUsersComponents;

  ChatUserListState({required this.chatUsersComponents});
}