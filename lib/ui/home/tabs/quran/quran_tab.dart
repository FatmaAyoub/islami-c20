import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c20/core/resources/app_constants.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/core/resources/strings_manager.dart';
import 'package:islami_c20/ui/home/tabs/quran/widgets/most_recent_item.dart';
import 'package:islami_c20/ui/home/tabs/quran/widgets/sura_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.quranBack),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AssetsManager.header,
                width: screenWidth * 0.7,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 21),
            TextField(
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: ColorsManager.whiteColor,
              ),
              cursorColor: ColorsManager.goldColor,
              decoration: InputDecoration(
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 28,
                  maxWidth: 50
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14
                  ),
                  child: SvgPicture.asset(
                    AssetsManager.quranTab,
                    height: 28,
                    width: 28,
                    colorFilter: ColorFilter.mode(
                        ColorsManager.goldColor,
                        BlendMode.srcIn),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorsManager.goldColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorsManager.goldColor),
                ),
                hintText: StringsManager.suraName,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ColorsManager.whiteColor,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(StringsManager.mostRecent,style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: ColorsManager.whiteColor
            ),),
            SizedBox(height: 10,),
            SizedBox(
              height: screenHeight*0.16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MostRecentItem();
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10,),
                  itemCount: 10
              ),
            ),
            SizedBox(height: 10,),
            Text(StringsManager.suraList,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ColorsManager.whiteColor
            ),),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => SuraItem(AppConstants.surasList[index]),
                  separatorBuilder: (context, index) => Divider(
                    color: ColorsManager.whiteColor,
                    indent: 40,
                    endIndent: 40,
                  ),
                  itemCount: AppConstants.surasList.length
              ),
            )
          ],
        ),
      ),
    );
  }
}
