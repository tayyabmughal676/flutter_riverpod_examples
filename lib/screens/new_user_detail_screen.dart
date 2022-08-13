import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/models/NewUserResponse.dart';

class NewUserDetailScreen extends StatelessWidget {
  final NewUserResponse newUserResponse;

  const NewUserDetailScreen({Key? key, required this.newUserResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(newUserResponse.avatar),
                ),
              ),
              Text(
                "${newUserResponse.firstName}.${newUserResponse.lastName}",
              ),
              Text(newUserResponse.email)
            ],
          ),
        ),
      ),
    );
  }
}
