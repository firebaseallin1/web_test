
 import 'package:equatable/equatable.dart';

abstract class AdminDashboardEvent extends Equatable {

  const AdminDashboardEvent();

}


class ToggleDrawer extends AdminDashboardEvent{

  @override
  List<Object?> get props => [];
}


 class ChangeSidebarItemEvent extends AdminDashboardEvent {

   final int index;
   const ChangeSidebarItemEvent(this.index);

  @override
  List<Object?> get props => [index];
 }

 class ChatUserListEvent extends AdminDashboardEvent{

  @override
  List<Object?> get props => [];

 }





