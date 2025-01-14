import 'package:flutter/material.dart';
import 'package:petbook/utils/constants.dart';
import 'package:petbook/utils/utils.dart';

class BannerAd extends StatefulWidget {
  const BannerAd({super.key});

  @override
  State<BannerAd> createState() => _BannerAdState();
}

class _BannerAdState extends State<BannerAd> {
  int currentAd = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize();
    double smallAdDimension = screenSize.width / 5;
    //Image and gradient
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onHorizontalDragEnd: (_) {
                if (currentAd == largeAds.length - 1) {
                  setState(() {
                    currentAd = 0;
                  });
                } else {
                  setState(() {
                    currentAd++;
                  });
                }
              },
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  largeAds[currentAd],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: screenSize.width,
                height: screenSize.height / 8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white.withOpacity(0.000001)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: smallAdDimension,
          width: screenSize.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children : [
              getSmallAdWidget(
                index: 0,
                side: smallAdDimension,
              ),
              getSmallAdWidget(
                index: 1,
                side: smallAdDimension,
              ),
              getSmallAdWidget(
                index: 2,
                side: smallAdDimension,
              ),
              getSmallAdWidget(
                index: 3,
                side: smallAdDimension,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getSmallAdWidget({required int index, required double side}) {
    return Container(
        height: side,
        width: side,
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 8),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  payment[index],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    payments[index],
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
