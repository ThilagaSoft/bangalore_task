import 'package:task_pro/database/local_db.dart';
import 'package:task_pro/model/user_model.dart';

class AuthRepository

{  final LocalDatabase db = LocalDatabase.instance;


Future<UserModel> register(
      String username,
      String email,
      String phone,
      String password,
      String countryCode,
      ) async {
    final existing = await db.getUserModelByEmail(email);
    if (existing != null)
    {
      throw Exception("User already exists");
    }

    final user =
    {
      "userName":username,
      "email":email,
      "mobile":phone,
      "password":password,
      "countryCode":countryCode,
    };
    final id = await db.insertUserModel(user);
    return UserModel(
        id: id,
        userName: username,
        email: email,
        mobile: phone,
        password: password,
        countryCode: countryCode);
  }


Future<UserModel?> login(String email, String password) async {
  print("🔑 Login attempt: $email / $password");
  final user = await db.getUserModelByEmail(email);

  if (user == null)
  {
    print("❌ User not found");
    throw Exception("User not found");
  }

  print("✅ User found: ${user.email} / ${user.password}");

  if (user.password != password)
  {
    print("❌ Password mismatch: expected ${user.password}, got $password");
    throw Exception("Invalid password");
  }

  print("🎉 Login successful");
  return user;
}

}
