import 'package:berasa_mobile/app/data/Model/DonasiModel.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CardRiwayat extends StatelessWidget {
  final DonasiModel don;
  CardRiwayat({super.key, required this.don});

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
                  image:
                      don.barangDonasi.isNotEmpty &&
                              don.barangDonasi[0].galeriMakanan.isNotEmpty
                          ? NetworkImage(
                            "http://192.168.1.5:5000${don.barangDonasi[0].galeriMakanan[0].url}",
                          )
                          : AssetImage("assets/berhasil.png") as ImageProvider,
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
                        don.tanggal!,
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
                        don.nama,
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
                        don.alamat,
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
