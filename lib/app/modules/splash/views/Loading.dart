import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(gradient: biruGradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: 70,
                  height: 105,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                    ),
                  ),
                ),
                Text(
                  "Berasa.",
                  style: putihSty.copyWith(fontSize: 30, fontWeight: bold),
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 14),
                  Text(
                    "Tunggu Sebentar ya",
                    style: putihSty.copyWith(fontSize: 18, fontWeight: light),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
