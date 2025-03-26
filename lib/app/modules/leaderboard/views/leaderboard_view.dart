import 'package:berasa_mobile/app/modules/leaderboard/controllers/leaderboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:berasa_mobile/tema.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  final LeaderboardController controller = Get.put(LeaderboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leaderboard",
          style: abu2Sty.copyWith(fontSize: 20, fontWeight: bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTabButton("Today"),
                _buildTabButton("Week"),
                _buildTabButton("All Time"),
              ],
            ),
          ),
          SizedBox(height: 20),
          _buildTopRankers(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: List.generate(
                8,
                (index) => _buildRankTile(index + 1, "User $index"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title) {
    return GestureDetector(
      onTap: () => controller.selectedTab.value = title,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color:
              controller.selectedTab.value == title
                  ? Colors.blue
                  : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: abu2Sty.copyWith(
            fontSize: 14,
            fontWeight: bold,
            color:
                controller.selectedTab.value == title
                    ? Colors.white
                    : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildTopRankers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfile("Amad", "assets/sp2.png", 2),
        _buildProfile("Arda", "assets/sp2.png", 1, isMain: true),
        _buildProfile("Amad", "assets/sp2.png", 3),
      ],
    );
  }

  Widget _buildProfile(
    String name,
    String imagePath,
    int rank, {
    bool isMain = false,
  }) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: isMain ? 40 : 30,
              backgroundImage: AssetImage(imagePath),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "$rank",
                  style: abu2Sty.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(name, style: abu2Sty.copyWith(fontSize: 14, fontWeight: bold)),
      ],
    );
  }

  Widget _buildRankTile(int rank, String name) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "$rank",
                style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
              ),
              SizedBox(width: 10),
              Text(name, style: abu2Sty.copyWith(fontSize: 14)),
            ],
          ),
          CircleAvatar(radius: 10, backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}
