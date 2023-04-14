import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage(this.id, {super.key});

  final String? id;

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    // create: (_) => DashboardCubit(),
    // child: const DashboardView(),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text('User#$id'),
      ),
      body: Center(
        child: Text(id!),
      ),
    );
  }
}
