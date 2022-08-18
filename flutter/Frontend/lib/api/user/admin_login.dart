import 'dart:convert';
import "package:http/http.dart";
import 'package:Login/env/variables.dart';
import 'package:Login/storage/secureStorage.dart';

//Basically for logging in and getting a jwt in return You can use Username instead of email
Future<bool> adminLogin(String username, String Password) async {
  //Headers
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  //Storage instance
  final secureStorage secureStore = secureStorage();

  //Register Request to strapi
  Response response = await post(Uri.parse(api + "api/auth/local"),
      headers: headers,
      body: jsonEncode({
        'identifier': username,
        'password': Password,
      }));

  //Parsing the Response
  Map data = jsonDecode(response.body);

  // print(data["jwt"]);

  print(response.statusCode);

  //Checking if Jwt is not null and status code is positive
  if (data['jwt'] != null && response.statusCode == 200) {
    //Writing Jwt to SecureData
    secureStore.writeSecureData('jwt', '${data['jwt']}');

    return true;
  }
  return false;
}
