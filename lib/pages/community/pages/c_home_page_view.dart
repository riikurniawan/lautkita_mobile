import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lautkita_mobile/pages/community/widget/search_bar_widget.dart';

class CHomePageView extends StatelessWidget {
  const CHomePageView({
    super.key,
    required this.searchBox,
  });

  final TextEditingController searchBox;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.white,
          // TODO : tanyakan warna teks dan kursor pada TextField
          title: SearchBarWidget(searchBox: searchBox),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F7F9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset("assets/icons/send.svg"),
                  )),
            ),
          ],
        )
      ],
    );
  }
}
