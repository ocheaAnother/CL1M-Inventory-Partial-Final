import 'dart:convert';
import "package:http/http.dart";
import 'package:Login/env/variables.dart';
import 'package:Login/storage/secureStorage.dart';

//Registers User with Strapi
Future<bool> RegisterUser(
    String username, String Email, String Password, String usertype) async {
  //Headers
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  //Instance of Storage
  final secureStorage secureStore = secureStorage();

  //Register User Request to strapi
  Response response = await post(Uri.parse(api + "api/auth/local/register"),
      headers: headers,
      body: jsonEncode({
        'username': username,
        'email': Email,
        'user_type': usertype,
        'password': Password,
      }));

  //Parsing the Response
  Map data = jsonDecode(response.body);
  // print(data['jwt']);

  print(response.statusCode);
  //Checking if Jwt is not null and status code is positive
  if (data['jwt'] != null && response.statusCode == 200) {
    //Writing Jwt to SecureData
    secureStore.writeSecureData('jwt', '${data['jwt']}');

    return true;
  }
  return false;
}
