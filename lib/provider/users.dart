import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/dummy_users.dart';
import 'package:flutter_application_1/user.dart';
import 'package:http/http.dart';

class Users with ChangeNotifier {
  final _baseUrl = 'https://app-clientes-75b92-default-rtdb.firebaseio.com/';
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  Future<void> put(User user) async {
    if (user == null) {
      return;
    }

    if (user.id.toString().trim().isNotEmpty && _items.containsKey(user.id)) {

        await patch(
        Uri.parse("$_baseUrl/users/${user.id}.json"),
        body: json.encode({
          'name': user.name,
          'email': user.email,
          'avatarUrl': user.avatarUrl,
        }),
      );
      _items.update(
        user.id.toString(),
        (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      final response = await post(
        Uri.parse("$_baseUrl/users.json"),
        body: json.encode({
          'name': user.name,
          'email': user.email,
          'avatarUrl': user.avatarUrl,
        }),
      );

      final id = json.decode(response.body)['name'];

      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
