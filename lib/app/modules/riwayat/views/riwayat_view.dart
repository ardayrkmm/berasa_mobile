import 'package:berasa_mobile/app/Widget/CardRiwayat.dart';
import 'package:berasa_mobile/tema.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  const RiwayatView({super.key});
  @override
  Widget build(BuildContext context) {
    final RiwayatController riw = Get.find<RiwayatController>();

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [Tab(text: "Proses"), Tab(text: "Selesai")],
          ),
          title: const Text("Riwayat"),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            Obx(
              () =>
                  riw.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 20,
                        ),
                        itemCount: riw.prosesList.length,
                        itemBuilder: (context, index) {
                          return CardRiwayat(don: riw.prosesList[index]);
                        },
                      ),
            ),
            Obx(
              () =>
                  riw.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : riw.selesaiList.isEmpty
                      ? const Center(child: Text("Belum Ada data"))
                      : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 20,
                        ),
                        itemCount: riw.selesaiList.length,
                        itemBuilder: (context, index) {
                          return CardRiwayat(don: riw.selesaiList[index]);
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
