import 'package:flutter/material.dart';
import 'package:linked_all_pages/screens/auth_screens/login_screen.dart';
import 'package:linked_all_pages/screens/home_screen.dart';
import 'package:linked_all_pages/screens/login.dart';
import 'package:linked_all_pages/screens/loginn.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<OnWalkThrough> walkThroughData = [
      OnWalkThrough(
        image: "assets/onboard1.png",
        title: "Discover Place Near You",
        description:
            "We made it simple to find items you seek. Enter your address and let us do the rest.",
      ),
      OnWalkThrough(
        image: "assets/onboard2.png",
        title: "Choose your Desired Item",
        description:
            "We made it simple to find items you seek. Enter your address and let us do the rest.",
      ),
      OnWalkThrough(
        image: "assets/onboard3.png",
        title: "Pick Up                                  or Delivery",
        description:
            "We made it simple to find items you seek. Enter your address and let us do the rest.",
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => loginScreen()));
                });
              },
              child: const Text(
                "skip",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w800),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Expanded(
              child: PageView.builder(
                  itemCount: walkThroughData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => WalkThroughContent(
                      pageIndex: index, walkThroughData: walkThroughData)))
        ],
      ),
    );
  }
}

class OnWalkThrough {
  final String image, title, description;

  OnWalkThrough({
    required this.image,
    required this.title,
    required this.description,
  });
}

class WalkThroughContent extends StatelessWidget {
  const WalkThroughContent({
    super.key,
    required this.pageIndex,
    required this.walkThroughData,
  });

  final int pageIndex;
  final List<OnWalkThrough> walkThroughData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Container(
              width: 287,
              height: 315,
              decoration: ShapeDecoration(
                  color: const Color(0xFFD5E2EA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: const [
                    BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0)
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Container(
              width: 287,
              height: 315,
              decoration: ShapeDecoration(
                  color: const Color(0xFFD5E2EA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: const [
                    BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0)
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              width: 287,
              height: 315,
              decoration: ShapeDecoration(
                  color: const Color(0xFFD5E2EA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: const [
                    BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0)
                  ]),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 180,
              ),
              Image.asset(
                walkThroughData[pageIndex].image,
                width: 136,
                height: 136,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 216,
                child: Text(
                  walkThroughData[pageIndex].title,
                  style: const TextStyle(
                    color: Color(0xFFFAA933),
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 216,
                child: Text(
                  walkThroughData[pageIndex].description,
                  style: const TextStyle(
                    color: Color(0xFF393F42),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      walkThroughData.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: DotIndicator(
                              isActive: index == pageIndex,
                            ),
                          ))
                ],
              ),
              pageIndex == 2
                  ? Padding(
                      padding: const EdgeInsets.only(left: 200, top: 50),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return login();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "Get started",
                              style: TextStyle(
                                  color: Color(0xFFFAA933),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Roboto'),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFFFAA933),
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: 73,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Container(
            width: 30,
            height: 5,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: const Color(0xFFFAA933),
            ),
          )
        : Container(
            width: 30,
            height: 5,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: const Color(0xFFD5E2EA),
            ),
          );
  }
}
