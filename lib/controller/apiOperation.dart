// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart ' as http;

class ApiOperations {
  static GetTrendingWallpapers() async {
    await http
        .get(Uri.parse("https://api.unsplash.com/photos/?client_id"), headers: {
      "Authorizations": "qn0tZzhLp3IKaKwzpo-inYRyE5yzOcCD3IoSc4MbAAs",
    }).then((value) {
      print(value.body);
    });
  }
}
