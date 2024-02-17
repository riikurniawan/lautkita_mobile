import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../common/global_variables.dart';
import '../data/models/article_response_model.dart';

class ArticleDetail extends StatefulWidget {
  final Post post;
  const ArticleDetail({Key? key, required this.post}) : super(key: key);

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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      '${GlobalVariables.baseUrl}${widget.post.image}',
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
                            onPressed: () {
                              Navigator.maybePop(context);
                            },
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
                      Expanded(
                        flex: 2,
                        child: Text(
                          widget.post.title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 25,
                              ),
                            ],
                          ),
                          child: ClipRect(
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              leading: const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/avatarman.png"),
                                radius: 35,
                              ),
                              title: Text(
                                widget.post.author?.name ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: const Text(
                                "Writer",
                                style: TextStyle(
                                  color: Color(0xFFACAFC3),
                                  fontSize: 18,
                                ),
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

            // Bagian bawah dengan konten artikel
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.category?.name ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF333647),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          child: SingleChildScrollView(
                            child: HtmlWidget(
                              widget.post.body!,
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
