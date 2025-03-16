import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_acara_controller.dart';

class DetailAcaraView extends GetView<DetailAcaraController> {
  const DetailAcaraView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailAcaraView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailAcaraView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
