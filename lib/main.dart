import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical_test_nasari_mobile/providers/todo_provider.dart';
import 'package:technical_test_nasari_mobile/screens/add_todo_screen.dart';
import 'package:technical_test_nasari_mobile/screens/edit_todo_screen.dart';
import 'package:technical_test_nasari_mobile/screens/home_screen.dart';
import 'package:technical_test_nasari_mobile/screens/login_screen.dart';
import 'package:technical_test_nasari_mobile/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  String? token = prefs.getString('token');

  runApp(
    ChangeNotifierProvider<TodoProvider>(
      create: (_) => TodoProvider(),
      child: MainApp(isFirstTime: isFirstTime, token: token),
    ),
  );
}

class MainApp extends StatelessWidget {
  final bool isFirstTime;
  final String? token;

  MainApp({required this.isFirstTime, required this.token});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);

    Future.delayed(Duration.zero, () async {
      await todoProvider.loadTodosFromSharedPreferences();
    });

    return MaterialApp(
      initialRoute: isFirstTime
          ? '/welcome'
          : token != null
              ? '/home'
              : '/login',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/addTodo': (context) => AddTodoScreen(),
        '/editTodo': (context) => EditTodoScreen(),
      },
    );
  }
}
