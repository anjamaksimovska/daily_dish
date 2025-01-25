import 'package:flutter/material.dart';

class AllDoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Done!')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'ALL DONE!',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Congratulations, chef!\n\n'
              'You’ve just created something amazing—time to savor the fruits of your labor.\n\n'
              'Don’t forget to come back tomorrow for a brand-new, exciting recipe to inspire your next culinary adventure.\n\n'
              'Keep cooking, keep creating, and keep surprising yourself!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
