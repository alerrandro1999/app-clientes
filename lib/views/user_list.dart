import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/user_tile.dart';
import 'package:flutter_application_1/provider/users.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.userForm
              );
            }, 
            icon: const Icon(Icons.add)
            )
        ],
        ),
        body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i))
          ),
    );
  }
}