import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:berasa_mobile/tema.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget bagianHeader() {
      return Stack(
        alignment: Alignment.center,
        children: [
          // Background header
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
          ),
          // Tombol back
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          // Foto profil
          Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("assets/pp.jpg"),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () {
                    print("Ganti Foto Profil");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.edit, color: Colors.blueAccent, size: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget inputField(String icon, String label) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 6),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Image.asset(icon, width: 18),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget bagianContent() {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            inputField("assets/nama.png", "Nama"),
            inputField("assets/email.png", "Email"),
            inputField("assets/telp.png", "No Telp"),
            inputField("assets/lokasiitem.png", "Alamat"),
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [bagianHeader(), Expanded(child: bagianContent())],
      ),
    );
  }
}
