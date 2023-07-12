// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart ' as http;

class ApiOperations {
  static GetTrendingWallpapers() async {
   await http.get(Uri.parse("https://api.pexels.com/v1/curated?page=3&per_page=40"), headers: {
      "Authorizations":
          "563492ad6f9170000100000176c2c175fccd4ef49048d87c28263ebf"
    }).then((value) => print(value.body),);
  }
}
