import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardProgram extends StatelessWidget {
  const CardProgram({super.key});

  @override
  Widget build(BuildContext context) {
    Widget bagianText() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Column(
          children: [
            Text(
              "Pantiasuhan Margadana membutuhkan bantuanmu...",
              style: abu2Sty.copyWith(fontSize: 12, fontWeight: light),
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: abu2Cerah,
                  ),
                ),
                Container(
                  width: 200,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xff1AC0FA),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  child: Text(
                    "Donasi yang terkumpul 143 / 200 Bungkus",
                    softWrap: true,

                    style: abu2Sty.copyWith(fontSize: 12, fontWeight: light),
                  ),
                ),
                Text(
                  "Sisa 2 hari",
                  style: abu2Sty.copyWith(fontSize: 12, fontWeight: light),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 18),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: putih,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 112,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/ilhead.png"),
              ),
            ),
          ),
          bagianText(),
        ],
      ),
    );
  }
}
