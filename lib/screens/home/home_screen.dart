import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_app/screens/add/add_user_screen.dart';
import 'package:state_management_app/screens/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pengguna'),
        actions: [
          IconButton(onPressed: () {
            Get.to(() => AddUserScreen());
          },
          icon: Icon(Icons.add),)
        ],
      ),
      body: Obx(() {
        if(controller.isLoading.value){
          return Center(child: CircularProgressIndicator(),);
        }
        if(controller.users.isEmpty) {
          return Center(
            child: Text("Tidak ada data pengguna"),
          );
        }
        return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              var user = controller.users[index];
              return Container(
                decoration: BoxDecoration(

                ),
                child: ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                ),
              );
            }
        );
    }),
    );
  }
}