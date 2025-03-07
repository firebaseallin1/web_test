import 'dart:convert';

import 'package:untitled/lib/data/model/user_model/users_model.dart';


class UsersRawModel {



  UsersRawModel usersRawModelResponseFromJson(String str) => UsersRawModel.fromJson(json.decode(str));

  String usersRawModelResponseToJson(UsersRawModel data) => json.encode(data.toJson());


  int? status;
  String? message;
  List<UsersComponents>? usersComponents;

  UsersRawModel({this.status, this.message, this.usersComponents});

  UsersRawModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      usersComponents = <UsersComponents>[];
      json['result'].forEach((v) {
        usersComponents!.add(UsersComponents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (usersComponents != null) {
      data['result'] = usersComponents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


