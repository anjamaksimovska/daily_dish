import 'package:flutter/material.dart';
import 'recipe_screen.dart';

class IngredientsScreen extends StatelessWidget {
  final Map<String, dynamic>? recipe;

  const IngredientsScreen({super.key, this.recipe});

  @override
  Widget build(BuildContext context) {
    // Extract ingredients and measures from the recipe
    final ingredients = recipe != null
        ? List.generate(
            20,
            (index) {
              final ingredient = recipe!['strIngredient${index + 1}'];
              final measure = recipe!['strMeasure${index + 1}'];
              if (ingredient != null && ingredient.isNotEmpty) {
                return '$measure $ingredient';
              }
              return null;
            },
          ).where((item) => item != null).toList()
        : [];

    return Scaffold(
      appBar: AppBar(title: Text('Ingredients')),
      body: ingredients.isEmpty
          ? Center(child: Text('No ingredients found.'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: ingredients.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            ingredients[index]!,
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeScreen(recipe: recipe),
                        ),
                      );
                    },
                    child: Text('Continue to Recipe'),
                  ),
                ],
              ),
            ),
    );
  }
}
