
 import 'dart:ui';

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


 class DraweDataEvent extends AdminDashboardEvent{

  @override

  List<Object?> get props => [];

 }

 class DrawerPositionEvent extends AdminDashboardEvent{
  final Offset  pos;
  final int  clickedPos;
  final String selectedValue;

  const DrawerPositionEvent({required this.pos,required this.clickedPos,required this.selectedValue});

  @override
  List<Object?> get props => [pos];

 }


 class DropSelectValEvent extends AdminDashboardEvent{
   final String? selectVal;

  const DropSelectValEvent({required this.selectVal});

  @override
  // TODO: implement props
  List<Object?> get props => [selectVal];

 }







