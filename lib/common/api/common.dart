import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';

const String url = "temp" ;

Future<Map<String, dynamic>> makeGetRequest(String urlStr) async {
  // The URL of the API endpoint
  final url = Uri.parse(urlStr);

  // Sending a GET request
  final response = await http.get(url);

  // Checking if the request was successful
  if (response.statusCode == 200) {
    // Decoding the JSON response
    final data = json.decode(response.body);
    print('GET Response: $data');
    return data;
  } else {
    print('Failed to load data. Status code: ${response.statusCode}');
    return {'error': response.statusCode} ;
  }
}

Future<void> makePostRequest(String urlStr, Map<String, dynamic> inData) async {
  // The URL of the API endpoint
  final url = Uri.parse(urlStr);

  // Sending a POST request
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
    body: json.encode(inData),
  );

  // Checking if the request was successful
  if (response.statusCode == 201) {
    // Decoding the JSON response
    final data = json.decode(response.body);
    print('POST Response: $data');
  } else {
    print('Failed to post data. Status code: ${response.statusCode}');
  }
}


void test(){
  var data = makeGetRequest('https://jsonplaceholder.typicode.com/posts/1');
  var d = makePostRequest('https://jsonplaceholder.typicode.com/posts', {
    'title': 'rohan',
    'body': 'bar',
    'userId': 1,
  });
}
