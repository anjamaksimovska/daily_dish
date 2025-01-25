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
}


