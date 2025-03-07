import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/const/consts.dart';
import '../../data/model/chat_user_model/chat_users_raw_model.dart';

class AdminDashboardRepo{

  Future<ChatUserModel> chatUserRepo() async {

    try{

      var response=await http.get(Uri.parse('${StringValues.baseUrl}getchatuserdata'));
      print('respdata${response.statusCode}');

      return ChatUserModel.fromJson(jsonDecode(response.body));

    }on SocketException catch(e){
      print('socket ${e.message}');
      return ChatUserModel(status: 0,message: e.message,result: []);
    }catch (e){
      print('socket ${e.toString()}');
      return ChatUserModel(status: 0,message: e.toString(),result: []);
    }

  }

}