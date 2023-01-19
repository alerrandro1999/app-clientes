import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Formulário de Usuário'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save),
            )
          ],
        ),
        body: const Padding(padding: EdgeInsets.all(10)),
        child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'URL do Avatar'),
                )
              ],
            ),
        ),
    );
  }
}


// https://www.youtube.com/watch?v=ViahqKZzZ7Y&list=LL&t=1717s