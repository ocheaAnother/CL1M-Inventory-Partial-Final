import 'package:Login/storage/secureStorage.dart';

//To check if user is loggedin
Future<bool> IsUserLoggedIn() async {
  //AuthStorage class instance
  storageAuth secureStore = storageAuth();

  //Getting Jwt from SecureStorage
  String jwt = await secureStore.getJwt();

  // if Jwt is null getJwt will return "false"
  if (jwt != "false") {
    // TODO: make a function here to validate jwt from strapi...
    return true;
  }
  return false;
}
