import 'dart:convert';
import 'package:http/http.dart' as http;

const String prod_url = 'https://easy-ferry.uc.r.appspot.com';
const String dev_url = 'http://';

Future<Map<String, String>> login(email, password) async {
  var headers = {
    'Content-Type': 'application/json',
  };

  var request = http.Request('POST', Uri.parse('$prod_url/login'));
  request.body = json.encode({
    "email": email,
    "password": password,
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var responseBody = await response.stream.bytesToString();
    print(responseBody);
    return {
      'status': '200',
      'message': responseBody,
    };
  } else {
    return {
      'status': '${response.statusCode}',
      'message': '${response.reasonPhrase}',
    };
  }
}
