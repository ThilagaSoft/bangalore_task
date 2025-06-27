class UserModel {
  final int id;
  final String userName;
  final String mobile;
  final String email;
  final String countryCode;
  final String password;

  UserModel({
    required this.id,
    required this.userName,
    required this.mobile,
    required this.email,
    required this.countryCode,
    required this.password,
  });

  UserModel copyWith({
    int? id,
    String? userName,
    String? mobile,
    String? email,
    String? countryCode,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      countryCode: countryCode ?? this.countryCode,
      password: password ?? this.password,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      userName: json['userName'] as String,
      mobile: json['mobile'] as String,
      email: json['email'] as String,
      countryCode: json['countryCode'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'mobile': mobile,
      'email': email,
      'countryCode': countryCode,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'UserModel(id: $id, userName: $userName, mobile: $mobile, email: $email, countryCode: $countryCode, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.userName == userName &&
        other.mobile == mobile &&
        other.email == email &&
        other.countryCode == countryCode &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    userName.hashCode ^
    mobile.hashCode ^
    email.hashCode ^
    countryCode.hashCode ^
    password.hashCode;
  }
}
