import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lautkita_mobile/pages/community/utils/bottom_app_bar_clipper.dart';
import 'package:lautkita_mobile/pages/community/utils/clip_shadow_path.dart';

class BottomAppBarWidget extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const BottomAppBarWidget({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: ClipShadowPath(
        shadow: const BoxShadow(
          color: Color(0x600396EF),
          offset: Offset(0, 1),
          blurRadius: 15,
          spreadRadius: 5,
        ),
        clipper: BottomAppBarClipper(),
        child: SizedBox(
          child: Container(
            height: 69.h,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      navItem(
                        "assets/icons/indicator.svg",
                        pageIndex == 0,
                        onTap: () => onTap(0),
                      ),
                      navItem(
                        "assets/icons/indicator.svg",
                        pageIndex == 1,
                        onTap: () => onTap(1),
                      ),
                      const SizedBox(),
                      navItem(
                        "assets/icons/indicator.svg",
                        pageIndex == 2,
                        onTap: () => onTap(2),
                      ),
                      navItem(
                        "assets/icons/indicator.svg",
                        pageIndex == 3,
                        onTap: () => onTap(3),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    navItem(
                      "assets/icons/home.svg",
                      pageIndex == 0,
                      onTap: () => onTap(0),
                    ),
                    navItem(
                      "assets/icons/shopping-basket.svg",
                      pageIndex == 1,
                      onTap: () => onTap(1),
                    ),
                    const SizedBox(),
                    navItem(
                      "assets/icons/notification.svg",
                      pageIndex == 2,
                      onTap: () => onTap(2),
                    ),
                    navItem(
                      "assets/icons/profile.svg",
                      pageIndex == 3,
                      onTap: () => onTap(3),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(String svgAsset, bool selected, {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: SvgPicture.asset(
          svgAsset,
          colorFilter: selected
              ? const ColorFilter.mode(
                  Color(0xFF00A8CC),
                  BlendMode.srcATop,
                )
              : null,
        ),
      ),
    );
  }
}
