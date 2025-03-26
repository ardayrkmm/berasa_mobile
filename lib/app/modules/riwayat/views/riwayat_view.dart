import 'package:berasa_mobile/app/Widget/CardRiwayat.dart';
import 'package:berasa_mobile/tema.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  const RiwayatView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [Tab(text: "Proses"), Tab(text: "Selesai")]),
          title: Text(
            'Riwayat',
            style: abu2Sty.copyWith(fontSize: 20, fontWeight: bold),
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: Column(children: [CardRiwayat()]),
            ),
            Center(child: Text("Belum Ada data")),
          ],
        ),
      ),
    );
  }
}
