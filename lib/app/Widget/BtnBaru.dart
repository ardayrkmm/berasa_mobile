import 'package:berasa_mobile/tema.dart';
import 'package:flutter/widgets.dart';

class BtnBaru extends StatelessWidget {
  double w, h;
  String nama;
  VoidCallback fungsi;
  BtnBaru({
    super.key,
    required this.w,
    required this.h,
    required this.nama,
    required this.fungsi,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fungsi,
      child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          gradient: biruGradient,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(
          child: Text(
            nama,
            style: putihSty.copyWith(fontSize: 16, fontWeight: bold),
          ),
        ),
      ),
    );
  }
}
