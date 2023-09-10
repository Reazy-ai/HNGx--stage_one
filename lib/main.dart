import 'package:flutter/material.dart';
import 'package:stage_one/profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/profile_screen': (context) => const ProfileScreen()
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Task one"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/pp.jpg',
                height: 200,
                width: 200,
                filterQuality: FilterQuality.high,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Ridwan Lawal",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/profile_screen'),
              child: const Text("Open Github"),
            ),
          ],
        ),
      ),
    );
  }
}
