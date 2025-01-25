import 'package:daily_dish/services/api_services.dart';
import 'package:flutter/material.dart';

class DishScreen extends StatefulWidget {
  const DishScreen({Key? key}) : super(key: key);

  @override
  State<DishScreen> createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen> {
  Map<String, dynamic>? recipe;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRecipe();
  }

  void _fetchRecipe() async {
    final ApiService apiService = ApiService();
    final fetchedRecipe = await apiService.fetchRandomRecipe();
    setState(() {
      recipe = fetchedRecipe;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Dish'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : recipe == null
              ? const Center(child: Text('Failed to load recipe'))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe!['title'] ?? 'No Title',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Image.network(recipe!['image'] ?? '', fit: BoxFit.cover),
                      const SizedBox(height: 20),
                      const Text(
                        'Ingredients:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(recipe!['ingredients'] ?? 'No ingredients available'),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the recipe screen
                        },
                        child: const Text('View Recipe'),
                      ),
                    ],
                  ),
                ),
    );
  }
}
