import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';

class MostRecentItem extends StatelessWidget {
  const MostRecentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 6,
        left: 17
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsManager.goldColor,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Al-Anbiya",style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorsManager.blackColor
              ),),
              Text("الأنبياء",style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorsManager.blackColor
              ),),
              Text("112 Verses",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: ColorsManager.blackColor
              ),),
            ],
          ),
          Image.asset(AssetsManager.mostRecent)
        ],
      ),
    );
  }
}
