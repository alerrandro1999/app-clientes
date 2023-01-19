import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/users.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_application_1/views/user_form.dart';
import 'package:flutter_application_1/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.home: (_) => UserList(),
          AppRoutes.userForm: (ctx) => UserForm()
        },
      ),
    );
  }
}
