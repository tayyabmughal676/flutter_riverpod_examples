import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/data_provider/data_provider.dart';
import 'package:flutter_riverpod_example/models/NewUserResponse.dart';
import 'package:flutter_riverpod_example/screens/new_user_detail_screen.dart';

class NewUserScreen extends ConsumerWidget {
  const NewUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var dataShared = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: SafeArea(
        child: dataShared.when(
            data: (data) {
              List<NewUserResponse> userList = data.map((e) => e).toList();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: userList.length,
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => NewUserDetailScreen(
                                        newUserResponse: userList[index]),
                                  ),
                                ),
                                child: Card(
                                  color: Colors.blue,
                                  elevation: 4,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ListTile(
                                    title: Text(
                                      userList[index].firstName.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      userList[index].firstName.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    trailing: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          userList[index].avatar.toString()),
                                    ),
                                  ),
                                ),
                              );
                            }))
                  ],
                ),
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }
}
