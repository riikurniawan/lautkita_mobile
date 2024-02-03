import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CampaignDetail extends StatefulWidget {
  const CampaignDetail({super.key});

  @override
  State<CampaignDetail> createState() => _CampaignDetailState();
}

class _CampaignDetailState extends State<CampaignDetail> {
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
                height: 370.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/Pexels_Photo_by_International_Fund_for_Animal_Welfare.png",
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
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: 39.w,
                            height: 39.h,
                            child: IconButton(
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.arrow_back_ios_new_rounded),
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/share-2.svg',
                                width: 20.w,
                                height: 20.h,
                              ),
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  width: 375.w,
                  height: 490.h,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const JudulCampaign(),

                        // Container Rating, Member, Lokasi
                        const ContainerRating(),

                        // About Campaign
                        const Text(
                          "\nAbout Campaign\n",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),

                        // Detail Campaign
                        SizedBox(
                          height: 100.h,
                          child: const SingleChildScrollView(
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

                        // Organisasi
                        ListTile(
                          leading: Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/Ellipse-17.png"),
                              ),
                            ),
                          ),
                          title: const Text(
                            "Ocean Rescue Inc",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text("Trusted charity organizer"),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0.0),
                        ),

                        //  2 Button Donate or Join Campaign
                        const ButtonDonateJoinCampaign()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 321.h,
              left: 164.w,
              child: SizedBox(
                width: 50.w,
                height: 50.h,
                child: const Divider(
                  color: Color(0xFFA8A8A8),
                  thickness: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonDonateJoinCampaign extends StatelessWidget {
  const ButtonDonateJoinCampaign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              backgroundColor: MaterialStatePropertyAll(Color(0xFFFF7029)),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
            child: const Text("Donate"),
          ),
          const Text(
            "or",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
              label: const Text("Join Campaign"),
              style: const ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                iconSize: MaterialStatePropertyAll(20),
                backgroundColor: MaterialStatePropertyAll(Color(0xFF00A8CC)),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ContainerRating extends StatelessWidget {
  const ContainerRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFFE6EEFA),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Rating
              const Column(
                children: [
                  Text("Rating"),
                  Row(
                    children: [
                      Icon(Icons.star_rate_rounded, color: Color(0xFFF7BD25)),
                      Text(
                        "4.5",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              // Garis
              SizedBox(
                height: 50.h,
                child: VerticalDivider(
                  width: 20.w,
                  thickness: 2,
                  color: Colors.amber,
                ),
              ),

              // Joined Member
              Column(
                children: [
                  const Text(
                    "Joined Member",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // cara buat image tumpuk: Widget SizedBox -> Stack -> Container decoration image
                  // Stack of Images
                  SizedBox(
                    width: 100.w,
                    height: 30.h,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.shade50,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white),
                            ),
                            child: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "+9",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Expanded(child: SizedBox()),
              // map atau lokasi
              Container(
                width: 55.w,
                height: 55.h,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/campaign-map.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JudulCampaign extends StatelessWidget {
  const JudulCampaign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // JUDUL
            Text(
              "Plastic Free",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Lokasi dan tanggal
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Lokasi
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 15,
                            color: Color(0xFF2F80ED),
                          ),
                          Text(
                            "Batam",
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Tanggal
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 15,
                          color: Color(0xFF2F80ED),
                        ),
                        Text(
                          "Aug 23",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        // favorit
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: const Color(0xFFE6EEFA),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Row(
            children: [
              Text(
                "2.5k",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(Icons.favorite, color: Color(0xFFFF0000)),
            ],
          ),
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 490;
    path.lineTo(-8 * _xScaling, 64.0614 * _yScaling);
    path.cubicTo(
      -8 * _xScaling,
      40.0929 * _yScaling,
      8.99827 * _xScaling,
      19.5202 * _yScaling,
      32.6594 * _xScaling,
      15.6937 * _yScaling,
    );
    path.cubicTo(
      73.9293 * _xScaling,
      9.01936 * _yScaling,
      138.42 * _xScaling,
      0.0283982 * _yScaling,
      186.5 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      234.903 * _xScaling,
      -0.028589 * _yScaling,
      299.86 * _xScaling,
      9.00662 * _yScaling,
      341.334 * _xScaling,
      15.703 * _yScaling,
    );
    path.cubicTo(
      365 * _xScaling,
      19.5241 * _yScaling,
      382 * _xScaling,
      40.098 * _yScaling,
      382 * _xScaling,
      64.0708 * _yScaling,
    );
    path.cubicTo(
      382 * _xScaling,
      64.0708 * _yScaling,
      382 * _xScaling,
      448 * _yScaling,
      382 * _xScaling,
      448 * _yScaling,
    );
    path.cubicTo(
      382 * _xScaling,
      475.614 * _yScaling,
      359.614 * _xScaling,
      498 * _yScaling,
      332 * _xScaling,
      498 * _yScaling,
    );
    path.cubicTo(
      332 * _xScaling,
      498 * _yScaling,
      42 * _xScaling,
      498 * _yScaling,
      42 * _xScaling,
      498 * _yScaling,
    );
    path.cubicTo(
      14.3858 * _xScaling,
      498 * _yScaling,
      -8 * _xScaling,
      475.614 * _yScaling,
      -8 * _xScaling,
      448 * _yScaling,
    );
    path.cubicTo(
      -8 * _xScaling,
      448 * _yScaling,
      -8 * _xScaling,
      64.0614 * _yScaling,
      -8 * _xScaling,
      64.0614 * _yScaling,
    );
    path.cubicTo(
      -8 * _xScaling,
      64.0614 * _yScaling,
      -8 * _xScaling,
      64.0614 * _yScaling,
      -8 * _xScaling,
      64.0614 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
