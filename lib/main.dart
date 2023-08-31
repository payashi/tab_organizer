import 'package:flutter/material.dart';
import 'package:tab_organizer/chrome_api.dart';

void main() {
  // runApp(const HomeScreen());
  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder<String>(
              initialData: 'init',
              future: getTabs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? 'empty');
                } else {
                  return const Text('no data');
                }
              },
            ),
            // FutureBuilder(
            //   initialData: 'init',
            //   future: getUrl(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Text(snapshot.data!);
            //     } else {
            //       return const Text('no data');
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
