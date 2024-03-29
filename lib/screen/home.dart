import 'package:api_call/models/user.dart';
import 'package:api_call/services.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<user> users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Api integration'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          //  final name = user.name;

          //   final name = user['name'['first'];
          // final imageUrl = user['picture']['thumbnail'];

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                  // foregroundImage: NetworkImage(imageUrl),
                  ),
              title: Text('${user.fullName}'),
              subtitle: Text(email),
            ),
          );
        },
        itemCount: users.length,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => FetchUsers(),
      // ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.FetchUsers();
    setState(() {
      users = response;
    });
  }
}
