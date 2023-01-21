import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/users.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_application_1/user.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.userForm,
                    arguments: user,
                  );
                },
                color: Colors.orange,
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Excluir Usuário'),
                      content: const Text('Tem certeza?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Não'),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<Users>(context, listen: false)
                                .remove(user);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Sim'),
                        ),
                      ],
                    ),
                  );
                },
                color: Colors.red,
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
