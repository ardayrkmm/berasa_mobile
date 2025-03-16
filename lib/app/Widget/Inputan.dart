import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Inputan extends StatelessWidget {
  double w, h;
  String icon, labelInput;
  Inputan({
    super.key,
    required this.w,
    required this.h,
    required this.icon,

    required this.labelInput,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      margin: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: abu2Cerah,
        borderRadius: BorderRadius.circular(28),
      ),
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 21,
            width: 21,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(icon)),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: abu2Sty.copyWith(fontSize: 14, fontWeight: semiBold),
              decoration: InputDecoration(
                hintText: labelInput,
                hintStyle: abu2Sty.copyWith(fontSize: 14, fontWeight: semiBold),

                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
