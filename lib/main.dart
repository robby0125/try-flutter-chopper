import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:try_retrofit/provider/user_provider.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        home: ListUserPage(),
      ),
    );
  }
}

class ListUserPage extends StatefulWidget {
  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chopper (Retrofit for Flutter)'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, users, _) {
          if (users.state == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final _listUser = users.listUser;

            return ListView(
              padding: EdgeInsets.all(8),
              children: List.generate(
                _listUser.length,
                (index) {
                  final _user = _listUser[index];

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(_user.avatar),
                      ),
                      title: Text('${_user.firstName} ${_user.lastName}'),
                      subtitle: Text(_user.email),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
