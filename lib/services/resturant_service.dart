import "dart:convert";
import "package:geolocator/geolocator.dart";
import "package:http/http.dart" as http;
import "./geolocation.dart";

const String baseUrl = 'https://theoptimiz.com/restro/public/api';

class BaseClient {
  var client = http.Client();
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }

  Future<dynamic> post(String api) async {
    var url = Uri.parse(baseUrl + api);
    Position position = await determinePosition();
    Map data = {'lat': position.latitude, "lng": position.longitude};
    var body = json.encode(data);
    var response = await client
        .post(url, body: body, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }
}
