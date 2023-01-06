class UserScreenContent {
  static const String userScreenContent =
      '''import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/data/response/status.dart';
import '/view_model/auth_view_model.dart';
import '/view_model/user_view_model.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final UserViewModel _userViewModel = UserViewModel();

  @override
  void initState() {
    _userViewModel.getUsersApi(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Success"),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthViewModel>(context, listen: false)
                  .logout(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ChangeNotifierProvider<UserViewModel>(
        create: (ctx) => _userViewModel,
        child: Consumer<UserViewModel>(
          builder: ((context, value, _) {
            print("rebuild widget:::::::::::: ");
            switch (value.userList.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.ERROR:
                return const Center(
                  child: Text("No users data found"),
                );
              case Status.COMPLETED:
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10, right: 10),
                          itemCount: value.userList.data?.data?.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  value.userList.data?.data?[index].avatar ??
                                      'https://picsum.photos/250?image=9',
                                  fit: BoxFit.cover,
                                  height: 150.0,
                                  width: 100.0,
                                ),
                              ),
                              trailing: const Text(
                                "View",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15),
                              ),
                              title: Text(
                                  '\${value.userList.data?.data?[index].firstName} \${value.userList.data?.data?[index].lastName}'),
                            );
                          }),
                    ],
                  ),
                );
              default:
                return const Center(
                  child: Text("NO data found"),
                );
            }
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }
}
''';
}
