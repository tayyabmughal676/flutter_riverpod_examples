import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/models/NewUserResponse.dart';
import 'package:flutter_riverpod_example/services/ApiServices.dart';

//Shared Global Providers
final userDataProvider = FutureProvider<List<NewUserResponse>>((ref) async {
  return ref.watch(userProvider).getUser();
});
