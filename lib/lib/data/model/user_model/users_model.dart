

class UsersComponents {
  int? docNo;
  String? userId;
  String? password;
  String? name;
  String? department;
  String? location;
  String? userType;
  String? userStatus;
  String? createdDate;

  UsersComponents(
      {this.docNo,
        this.userId,
        this.password,
        this.name,
        this.department,
        this.location,
        this.userType,
        this.userStatus,
        this.createdDate});

  UsersComponents.fromJson(Map<String, dynamic> json) {
    docNo = json['DocNo'];
    userId = json['UserId'];
    password = json['Password'];
    name = json['Name'];
    department = json['Department'];
    location = json['Location'];
    userType = json['UserType'];
    userStatus = json['UserStatus'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DocNo'] = docNo;
    data['UserId'] = userId;
    data['Password'] = password;
    data['Name'] = name;
    data['Department'] = department;
    data['Location'] = location;
    data['UserType'] = userType;
    data['UserStatus'] = userStatus;
    data['CreatedDate'] = createdDate;
    return data;
  }
}