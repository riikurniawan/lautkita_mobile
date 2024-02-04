import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
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
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  height: 260.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 1),
                        blurRadius: 1,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      // gambar
                      SizedBox(
                        height: 110.h,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          "https://img.freepik.com/free-photo/breathtaking-shot-beautiful-stones-turquoise-water-lake-hills-background_181624-12847.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      // teks
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                        child: Column(
                          children: [
                            // judul campaign dan 3 dot
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ocean Healty",
                                  style: TextStyle(
                                    color: Color(0xFF364C6F),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                Icon(Icons.more_vert, color: Color(0xFF98A2B3)),
                              ],
                            ),
                            // deskripsi
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                "Lorem ipsum dolor sit amet consectetur. Amet maecenas.Viverra mi euismod dinamik mi euismod",
                                style: TextStyle(
                                  color: Color(0xFF667085),
                                ),
                              ),
                            ),
                            // statistik dan tombol
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Raised of ",
                                          style: TextStyle(
                                            color: Color(0xFF2F80ED),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "15%",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          margin: EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE6EEFA),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            "Raise Goal",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF2F80ED),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          NumberFormat.currency(
                                            locale: 'id_ID',
                                            symbol: 'Rp',
                                            decimalDigits: 0,
                                          ).format(800000),
                                          style: TextStyle(
                                            color: Color(
                                              0xFF9EAEC8,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                Expanded(
                                  flex: 8,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text("DETAIL"),
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStatePropertyAll(
                                          Colors.white),
                                      backgroundColor: MaterialStatePropertyAll(
                                        Color(0xFF3EB5E8),
                                      ),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ),
      ],
    );
  }
}
