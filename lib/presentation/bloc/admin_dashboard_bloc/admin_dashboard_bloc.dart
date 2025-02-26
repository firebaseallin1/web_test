import 'package:allinone/domain/repositories/admin_dashboard_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'admin_dashboard_event.dart';
import 'admin_dashboard_state.dart';

class AdminDashboardBloc extends Bloc<AdminDashboardEvent, AdminDashboardState> {
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
    });


    on<ChatUserListEvent>((event,emit) async {
      print('userdata bloc called');
      await getUserData(event,emit);
      // emit(ChatUserListState(chatUsersComponents: event.props));
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
