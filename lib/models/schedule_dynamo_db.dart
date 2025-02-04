import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String,dynamic>> fetchData(String dayOfWeek) async {
  const apiUrl = "https://mtqlvltkr5.execute-api.us-east-1.amazonaws.com/timetflambda";
  final queryParams = {"ClassDay": dayOfWeek, "Class_ID":"KV_8"}; // Pass query params if needed
  final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return data;
    } else {
      print("Error: ${response.statusCode}");
    }
  } catch (e) {
    print("Failed to fetch data: $e");
  }
  return {};
}

void main(List<String> args) {
  fetchData("Monday");
}