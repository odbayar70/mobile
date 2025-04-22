import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotipyt/core/configs/assets/app-images.dart';
import 'package:spotipyt/core/configs/assets/app-vectors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.introBG),
              ),
            ),

            child: Column(
              children: [
                SvgPicture.asset(
                  AppVectors.logo
                ),
                Spacer(),
                Text(
                  'Enjoy lis'
                )
              ],
            ),
          ),

          Container(
            color: Colors.black.withOpacity(0.15),
          )
        ],
      ),
    );
  }
}
