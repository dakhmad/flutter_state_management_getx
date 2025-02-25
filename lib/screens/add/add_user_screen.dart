import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_app/screens/add/controller/add_user_controller.dart';

class AddUserScreen extends StatelessWidget {
  final AddUserController controller = Get.put(AddUserController());

  AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Pengguna'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),

            /// Dari sini
            ElevatedButton(
              onPressed: controller.addUser,
              child: Text('Tambah Data'),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void onClose() {
  //   controller.nameController.dispose();
  //   controller.emailController.dispose();
  //   onClose();
  // }
}
