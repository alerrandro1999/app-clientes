import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/users.dart';
import 'package:flutter_application_1/user.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  bool isLoading = false;

  final Map<String, String> _formData = {};
  void _loadFormData(user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    try {
      final user = ModalRoute.of(context)?.settings.arguments as User;
    _loadFormData(user);
    } catch (e) {}

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              _form.currentState!.save();

              setState(() {
                isLoading = true;
              });

              await Provider.of<Users>(context, listen: false).put(
                User(
                  id: _formData['id'].toString(),
                  name: _formData['name'].toString(),
                  email: _formData['email'].toString(),
                  avatarUrl: _formData['avatarUrl'].toString(),
                ),
              );

               setState(() {
                isLoading = false;
              });


              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: isLoading
       ? const Center(child: CircularProgressIndicator()) 
       : Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _formData['name'] = value.toString(),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                initialValue: _formData['email'],
                onSaved: (value) => _formData['email'] = value.toString(),
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value.toString(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
