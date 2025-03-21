import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfilView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
