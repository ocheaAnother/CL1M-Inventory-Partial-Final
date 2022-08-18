import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//Secure Storage Functions
class secureStorage {
  //Secure Storage Instance
  final _storage = FlutterSecureStorage();

  //Write to SecureStorage
  Future writeSecureData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  //Read from Secure Storage
  Future readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  //Delete entry from Secure Storage
  Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }
}

//This class is to handle Auth related read writes from storage like saving jwt etc
class storageAuth {
  final _storage = FlutterSecureStorage();

  //Getting Jwt from Storage
  Future getJwt() async {
    var jwt = await _storage.read(key: 'jwt');

    //If there is no Jwt we will return "false"
    if (jwt == null) {
      return "false";
    }
    return jwt;
  }

  //Logging Out User ie; Deleting Jwt
  Future logOutUser() async {
    var deleteData = await _storage.delete(key: 'jwt');
    return deleteData;
  }

  //Getting User Details from storage Currently not in use
  Future getUserDetails() async {
    var userDetails = await _storage.read(key: 'user');
    return userDetails;
  }
}
