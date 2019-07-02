import 'package:http/http.dart' as http;
import 'package:meetup_hibrido/services/queries.dart';

class Http {
  static Future<String> get(String query) async {
    http.Response httpResponse = await http.get(Queries.meetup);

    if (httpResponse.statusCode == 200) {
      return httpResponse.body;
    } else {
      print(httpResponse.statusCode);
      print(httpResponse.reasonPhrase);
      return null;
    }
  }
}
