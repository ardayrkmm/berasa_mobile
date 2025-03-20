import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CardRiwayat extends StatelessWidget {
  const CardRiwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL_RIWAYAT);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width: 81,
              height: 88,
              margin: EdgeInsets.only(right: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/berhasil.png"),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.date_range, color: biru, size: 30),
                      SizedBox(width: 10),
                      Text(
                        "14 -juli -2023",
                        style: abu2Sty.copyWith(fontSize: 18, fontWeight: bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.food_bank, color: biru, size: 30),
                      SizedBox(width: 10),
                      Text(
                        "Makanan Sehat",
                        style: abu2Sty.copyWith(fontSize: 18, fontWeight: bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.maps_home_work, color: biru, size: 30),
                      SizedBox(width: 10),
                      Text(
                        "Yayasan",
                        style: abu2Sty.copyWith(fontSize: 18, fontWeight: bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
