import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'feed.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//     );
//   }
// }
class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final double profileHeight = 144;
  final double coverHeight = 280;

  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.red,
            // onTap: (value) => {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => const Feed()))
            //     },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Feed',
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chat',
                  backgroundColor: Colors.red),
            ]),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            buildTop(),
            buildContent(),
          ],
        ));
  }

  Widget buildContent() => Column(
        children: [
          Column(
            children: [
              Text(
                'Kung Fu Panda',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'The Dragon Warrior',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 16),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                elevation: 2.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  child: Text(
                    "Skill Sets",
                    style: TextStyle(
                        letterSpacing: 2.0, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "App Developer || Digital Marketer",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
              ),
              Card(
                color: Colors.red,
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Project",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "15",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Followers",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "2000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSocialIcon(FontAwesomeIcons.slack),
                  const SizedBox(
                    width: 12,
                  ),
                  buildSocialIcon(FontAwesomeIcons.github),
                  const SizedBox(
                    width: 12,
                  ),
                  buildSocialIcon(FontAwesomeIcons.twitter),
                  const SizedBox(
                    width: 12,
                  ),
                  buildSocialIcon(FontAwesomeIcons.linkedin),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Divider(),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Followers:25M'),
                  const SizedBox(
                    width: 12,
                  ),
                  Text('Following:253'),
                  const SizedBox(
                    width: 12,
                  ),
                  Text('Post:22'),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ],
      );

  Widget buildTop() {
    final top = profileHeight / 2;
    final bottom = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: 200,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB5GUbMR2DKf-gSf1jVm5IO_xlKfJK-mBKcsU-PRotfw&s',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm6wg3bmKErxIgZd_eie4dCimb-H8gaMREqIGJIK0FfkBsSiotcGH0HTLQKZbs1T8YGo4&usqp=CAU'),
      );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
      radius: 25,
      child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(child: Icon(icon, size: 32)),
          )));
}
