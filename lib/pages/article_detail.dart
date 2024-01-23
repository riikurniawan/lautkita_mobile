import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({super.key});

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: 375.w,
                height: 405.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/bg-artikel.png",
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BackButton(
                            onPressed: () {},
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark_border_rounded,
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/icons/share-icon.svg",
                                ),
                                color: Colors.white,
                              )
                            ],
                          )
                        ],
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "Lorem Ipsum is simply dummy\ntext of the printing",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 3,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/Ellipse 5.png"),
                            radius: 35,
                          ),
                          title: Text(
                            "John Doe",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            "Writer",
                            style: TextStyle(
                              color: Color(0xFFACAFC3),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 375.w,
                height: 444.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Results\n",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF333647),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: SingleChildScrollView(
                            child: Text(
                              "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races.\n\n"
                              "For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters.\n\n"
                              "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races.\n\n"
                              "For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters.\n\n",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF666C8E),
                                height: 1.39,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
