import 'dart:convert';

import 'package:http/http.dart' as http;

class ApisHere {
  Future<Stream<List<String>>> getPhotos() async {
    try {
      http.Response resp = await http.get(Uri.parse(
          'https://api.unsplash.com/photos/random/?count=20&client_id=C5av5kvLL1Je2tPGsQlO4O8kZ98NrB9lDv2dpD3CRk0'));

      if (resp.statusCode == 200) {
        List<dynamic> gets = jsonDecode(resp.body) as List<dynamic>;
        List<String> strings =
            gets.map<String>((e) => e['urls']['regular']).toList();
        return Stream.value(strings);
      } else {
        return Stream.error("error Occurred Fetching Photos");
      }
    } catch (e) {
      return Stream.error(e.toString());
    }
  }
}
