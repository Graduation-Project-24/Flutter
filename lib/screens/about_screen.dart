import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    final List<CardInfoTeam> TeamData = [
      CardInfoTeam(
        image: "assets/toka.jpeg",
        name: "Toka Gamal",
        job: "Mobile Developer",
      ),
      CardInfoTeam(
        image: "assets/asmaa.jpg",
        name: "Asmaa Mohamed",
        job: "Backend Developer",
      ),
      CardInfoTeam(
        image: "assets/mai.jpg",
        name: "Mai Allam",
        job: "Backend Developer",
      ),
      CardInfoTeam(
        image: "assets/mohamed hazem.jpg",
        name: "Mohamed Hazem",
        job: "Backend Developer",
      ),
      CardInfoTeam(
        image: "assets/aboelmaged.jpg",
        name: " Ahmed Aboelmaged",
        job: "Backend Develope",
      ),
      CardInfoTeam(
        image: "assets/ashrakat.JPG",
        name: "Ashrakat",
        job: "Mobile Developer",
      ),
      CardInfoTeam(
        image: "assets/naira.JPG",
        name: "Naira saad",
        job: "Mobile Developer",
      ),
      CardInfoTeam(
        image: "assets/ahmed magdy.jpg",
        name: "Ahmed Magdy ",
        job: "Machine Learning",
      ),
      CardInfoTeam(
        image: "assets/esmael.jpg",
        name: "Esmael Saleh ",
        job: "Data Analyst",
      ),
      CardInfoTeam(
        image: "assets/omar.jpg",
        name: "Omar Khaled ",
        job: "Frontend Developer",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        // gradient: const LinearGradient(
        //   begin: Alignment(0.00, -1.00),
        //   end: Alignment(0, 1),
        //   colors: [Color(0xFF364A5A), Color(0xFF253036), Color(0xFF414E56)],
        // ),
        backgroundColor: const Color(0xFF414E56),
        centerTitle: true,
        title: const Text(
          'About',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.white), // Custom back icon
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          children: [
            const Text(
              'Who we are',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
            ),
            const Text(
                'Our Graduation project revolves around a cutting-edge E-Commerce system designed to redefine the online shopping experience. Users can effortlessly place orders through a user-friendly website or mobile application, initiating a seamless process that combines advanced technology and artificial intelligence.'),
            const Text(
                'The heart of the system lies in a Raspberry Pi-powered robot, meticulously engineered to navigate autonomously through a predefined space to retrieve items. What sets this project apart is the integration of an AI-powered algorithm, specifically the A* algorithm, which intelligently determines the optimal path for the robot to traverse in reaching the desired products.'),
            const Text(
                'The key to this efficiency is a meticulously crafted map that serves as a digital blueprint of the shopping environment. Each products precise location, represented by coordinates on the x, y, and z axes, is stored in a database. This spatial information is then utilized by the A* algorithm to calculate the most efficient route for the robot to follow, ensuring quick and precise retrieval of the ordered items.'),
            const Text(
                'Real-time updates are seamlessly communicated to users via the website, keeping them informed about the status of their orders. As the robot successfully retrieves the items, it strategically returns to a central point for streamlined delivery preparation.'),
            const Text(
              'How it works',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
            ),
            const SizedBox(
              width: 347,
              height: 163,
            ),
            const Text(
              'Team',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
            ),
            Container(
              height: 500,
              child: GridView.builder(

                  // shrinkWrap: true,
                  itemCount: TeamData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) =>
                      InfoTeamContect(pageIndex: index, TeamData: TeamData)),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInfoTeam {
  final String image, name, job;
  CardInfoTeam({
    required this.image,
    required this.name,
    required this.job,
  });
}

class InfoTeamContect extends StatelessWidget {
  const InfoTeamContect({
    super.key,
    required this.pageIndex,
    required this.TeamData,
  });

  final int pageIndex;
  final List<CardInfoTeam> TeamData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: ShapeDecoration(
        color: const Color(0xFFD5E2EA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          flex: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              TeamData[pageIndex].image,
              fit: BoxFit.cover,
              //alignment: Alignment.topCenter,
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(TeamData[pageIndex].name),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                TeamData[pageIndex].job,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            )),
      ]),
    );
  }
}
