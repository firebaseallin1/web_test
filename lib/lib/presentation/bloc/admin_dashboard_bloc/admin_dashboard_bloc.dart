
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/admin_dashboard_repo.dart';
import 'admin_dashboard_event.dart';
import 'admin_dashboard_state.dart';

class AdminDashboardBloc extends Bloc<AdminDashboardEvent, AdminDashboardState> {

  final List<String> drawerData=['Home','Chats','Google Maps','Profile','Settings','Logout'];

  AdminDashboardBloc() : super(AdminDashboardInitial()) {

    on<AdminDashboardEvent>((event, emit) {

    });

    on<ToggleDrawer>((event, emit){

    });

    if (kIsWeb) {
      add(ToggleDrawer());
    }

    on<ChangeSidebarItemEvent>((event,emit){
      emit(TabBarIndexState(selectedIndex: event.index));
      emit(AdminDashboardInitial());
    });


    on<ChatUserListEvent>((event,emit) async {
      print('userdata bloc called');
      await getUserData(event,emit);
      // emit(ChatUserListState(chatUsersComponents: event.props));
    });



    on<DraweDataEvent>((event,emit){
      print('event called ${drawerData.length}');
      emit(DrawerData(data: drawerData));
      emit(AdminDashboardInitial());
    });


    on<DrawerPositionEvent>((event,emit){
      emit(DrawerPositionState(position: event.pos,clickedPos: event.clickedPos,selectValue: event.selectedValue));
      emit(AdminDashboardInitial());
    });

    on<DropSelectValEvent>((event,emit){
      emit(DropSelectValState(selectVal: event.selectVal));
    });


  }

  Future getUserData( ChatUserListEvent event,Emitter<AdminDashboardState> emit) async {

    var response = await AdminDashboardRepo().chatUserRepo();

    if(response.status==1){
      emit(ChatUserListState(chatUsersComponents: response.result!));
    }else{
      emit(ChatUserListState(chatUsersComponents:[]));
    }

  }


}
