import 'dart:convert';
import 'package:Login/api/user/data_class.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BorrowedItemsService {
  //final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Borrow>> getPosts() async {
    // Response res = await get(postsURL);
    Response response = await http.get(
      Uri.parse('http://10.10.10.58:1337/api/borrowed-items'),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Borrow> borrow = body
          .map(
            (dynamic item) => Borrow.fromJson(item),
          )
          .toList();

      return borrow;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
