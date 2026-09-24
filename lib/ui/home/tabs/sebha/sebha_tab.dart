import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

int count = 0;
int index = 0;
double Angle = 0;
const List<String> sebhaList = [
  'سبحان الله',
  'الحمد لله',
  'الله أكبر',
  'لا حول ولا قوة الا بالله',
  'استغفر الله العظيم',
];

class _SebhaTabState extends State<SebhaTab> {
  @override
  Widget build(BuildContext context) {
    var screenMidiaQuery = MediaQuery.sizeOf(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.backesebha),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            const Color.fromARGB(255, 6, 6, 6).withValues(alpha: 0.9),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AssetsManager.header,
              height: screenMidiaQuery.height * .2,
            ),

            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.w600,
                color: ColorsManager.whiteColor,
              ),
              textAlign: TextAlign.center,
            ),

            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  AssetsManager.sebhahad,
                  height: screenMidiaQuery.height * .14,
                ),
                Container(
                  margin: EdgeInsets.only(top: screenMidiaQuery.height * .13),
                  child: Stack(
                    alignment: AlignmentGeometry.centerStart,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (count == 33) {
                              index++;
                              count = 0;
                            }
                            count++;
                            Angle++;
                          });
                        },
                        child: Transform.rotate(
                          angle: -Angle,
                          child: Image.asset(
                            AssetsManager.sebhaBody,
                            height: screenMidiaQuery.height * .4,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(100.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          spacing: screenMidiaQuery.height * .02,
                          children: [
                            Text(
                              sebhaList[index],

                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: ColorsManager.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            Text(
                              '$count',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: ColorsManager.whiteColor,
                              ),

                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
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
