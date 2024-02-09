import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.searchBox,
  });

  final TextEditingController searchBox;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43.h,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7F9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 8.0,
              ),
              child: SvgPicture.asset("assets/icons/search.svg"),
            ),
            Expanded(
              child: TextField(
                controller: searchBox,
                decoration: const InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Color(0xFFBDBDBD),
                    height: 1.45,
                  ),
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
