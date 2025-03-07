import 'dart:convert';

import 'chat_users_model.dart';

class ChatUserModel {


  ChatUserModel usersRawModelResponseFromJson(String str) => ChatUserModel.fromJson(json.decode(str));

  String usersRawModelResponseToJson(ChatUserModel data) => json.encode(data.toJson());


  int? status;
  String? message;
  List<ChatUsersComponents>? result;

  ChatUserModel({this.status, this.message, this.result});

  ChatUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <ChatUsersComponents>[];
      json['result'].forEach((v) {
        result!.add( ChatUsersComponents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


