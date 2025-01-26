import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://spoonacular.com/food-api';
  static const String _apiKey = '505e119433bd441cb28e844361d3fc76'; // Replace with your Spoonacular API key

  Future<Map<String, dynamic>?> fetchRandomRecipe() async {
    final url = '$_baseUrl/recipes/random?apiKey=$_apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['recipes'][0]; // Return the first recipe
      } else {
        print('Failed to fetch recipe: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<dynamic> get(String endpoint) async {
    final url = ApiConfig.addApiKey('${ApiConfig.baseUrl}$endpoint');
    final response = await http.get(
      Uri.parse(url),
      headers: ApiConfig.headers,
    );
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}

class ApiConfig {
  static const String apiKey = '505e119433bd441cb28e844361d3fc76';
  static const String baseUrl = 'https://api.spoonacular.com/recipes';
  
  static Map<String, String> get headers => {
    'Content-Type': 'application/json',
  };

  static String addApiKey(String url) {
    // Spoonacular expects 'apiKey' not 'x-api-key' as a query parameter
    return '$url${url.contains('?') ? '&' : '?'}apiKey=$apiKey';
  }
}


