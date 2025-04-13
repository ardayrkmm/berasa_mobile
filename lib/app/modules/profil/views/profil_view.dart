import 'package:berasa_mobile/app/data/Url/Urls.dart';
import 'package:berasa_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginc = Get.find<LoginController>();

    return Scaffold(
      body: Column(
        children: [
          // Bagian Header
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
              gradient: biruGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "http://192.168.1.5:5000/static/uploads/${loginc.user!.img_profil}",
                    ), // Foto profil
                  ),
                ),
                SizedBox(height: 10),
                Obx(
                  () => Text(
                    loginc.user!.nama,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bagian Menu
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                menuItem(
                  "assets/nama.png",
                  "Detail Profile",
                  () => Get.toNamed(Routes.DETAIL_PROFIL),
                ),
                menuItem("assets/edit.png", "Edit Profile", () {
                  Get.toNamed(Routes.UPDATE_PROFILE);
                }),
                menuItem("assets/lock.png", "Ubah Password", () {}),
                Divider(),
                menuItem("assets/about.png", "Tentang", () {}),
                menuItem("assets/lonceng.png", "Notifikasi", () {}),
                menuItem("assets/out.png", "Keluar", () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(String iconPath, String title, VoidCallback onTap) {
    return ListTile(
      leading: Image.asset(iconPath, width: 16),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 18),
      onTap: onTap,
    );
  }
}
