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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
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
                                        Icon(Icons.star_rate_rounded),
                                        Text("4.5"),
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
                                    const Text("Joined Member"),
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
                                              width: 20.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 10,
                                            child: Container(
                                              width: 20.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 20,
                                            child: Container(
                                              width: 20.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                color: Colors.pink,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 30,
                                            child: Container(
                                              width: 20.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 40,
                                            child: Container(
                                              width: 20.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.deepOrange.shade50,
                                                borderRadius:
                                                    BorderRadius.circular(30),
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
                                  width: 45.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // About Campaign
                        const Text(
                          "\nAbout Campaign\n",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF333647),
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
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.amber,
                            ),
                          ),
                          title: const Text("Ocean Rescue Inc"),
                          subtitle: const Text("Trusted charity organizer"),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0.0),
                        ),
                        SizedBox(
                          height: 50.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.grey),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                ),
                                child: const Text("Donate"),
                              ),
                              const Text(
                                "or",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_back_ios),
                                  label: const Text("Join Campaign"),
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.blueAccent),
                                    foregroundColor:
                                        MaterialStatePropertyAll(Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
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

class JudulCampaign extends StatelessWidget {
  const JudulCampaign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Column(
          children: [
            // JUDUL
            Text(
              "Plastic Free",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF333647),
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                // Lokasi
                SizedBox(
                  child: Row(
                    children: [Icon(Icons.location_on_outlined), Text("Batam")],
                  ),
                ),
                // Tanggal
                SizedBox(
                  child: Row(
                    children: [Icon(Icons.calendar_month), Text("Aug 23")],
                  ),
                )
              ],
            ),
          ],
        ),
        // favorit
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Row(
            children: [
              Text("2.5k"),
              Icon(Icons.favorite),
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
