import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  final Map<String, dynamic>? recipe;

  RecipeScreen({this.recipe});

  @override
  Widget build(BuildContext context) {
    // Extract recipe instructions
    final instructions = recipe?['strInstructions'] ?? 'No instructions available.';
    final steps = instructions.split('.').where((step) => step.trim().isNotEmpty).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Recipe')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RECIPE',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    title: Text(
                      steps[index].trim(),
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/all-done');
              },
              child: Text('Finish'),
            ),
          ],
        ),
      ),
    );
  }
}


