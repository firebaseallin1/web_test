class ChatUsersComponents {
  int? empID;
  String? userName;
  String? department;

  ChatUsersComponents({this.empID, this.userName, this.department});

  ChatUsersComponents.fromJson(Map<String, dynamic> json) {
    empID = json['EmpID'];
    userName = json['UserName'];
    department = json['Department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmpID'] = this.empID;
    data['UserName'] = this.userName;
    data['Department'] = this.department;
    return data;
  }
}