import 'package:flutter/material.dart';
import 'package:user_list_with_api_flutter/model/user.dart';
import 'package:user_list_with_api_flutter/services/api_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest API Call"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            // final name = user['name']['first'];
            // final email = user.email;
            // final imageUrl = user["picture"]["thumbnail"];
            // print(user);
            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.phone),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.imageUrl),
              ),
            );
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchUsers,
      // )
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
