import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/const/consts.dart';
import '../../data/model/user_model/user_raw_model.dart';

class LoginRepo{


  Future<UsersRawModel> login(body) async {

    try {
      var response = await http.post(Uri.parse("${StringValues.baseUrl}getlogin"),
          body: jsonEncode(body),
          headers: StringValues.apiHeader);
          print("sdjvbsdbvhd");

            // if (response.statusCode==200) {
            return UsersRawModel.fromJson(jsonDecode(response.body));
            // } else {
            //   UsersRawModel(message: , status: ,
            //       usersComponents: jsonResponse.map((user) => UsersComponents.fromJson(user)).toList());
            // }
          } on SocketException catch(e) {
            print("dsfdfdfdd ${e.message}");
             return UsersRawModel(message: e.message, status: 0,
                  usersComponents: []);
          } catch (e){

            print("scsssssssss $e");
            return UsersRawModel(message: e.toString(), status: 0,
                usersComponents: []);
          }





  }
}