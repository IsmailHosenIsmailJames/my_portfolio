import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/src/theme/colors.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ismail Hossain\'s Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: MyAppColors.primaryColor,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.sourceCodeProTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
          decorationColor: Colors.white,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Alignment _cursorPosition = Alignment.center;
  double count = 0;
  void _updateCursorPosition(Offset localPosition, Size size) {
    // Convert local position to Alignment
    double x = (localPosition.dx / (size.width / 2)) - 1;
    double y = (localPosition.dy / (size.height / 2)) - 1;
    Alignment newAlignment = Alignment(x, y);
    count++;
    if (count % 10 == 0) {
      count = 0;
      setState(() {
        _cursorPosition = newAlignment;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedContainer(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 200),
            alignment: _cursorPosition,
            child: Container(
              height: 200,
              width: 200,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(300),
                boxShadow: [
                  BoxShadow(
                    color: MyAppColors.primaryColor.withValues(alpha: 0.5),
                    blurRadius: 1000,
                    spreadRadius: 200,
                  ),
                ],
              ),
            ),
          ),

          GestureDetector(
            onPanUpdate: (details) {
              if (!kIsWeb) {
                //check if the platform is web or not
                RenderBox box = context.findRenderObject() as RenderBox;
                Offset localPosition = box.globalToLocal(
                  details.globalPosition,
                );
                _updateCursorPosition(localPosition, box.size);
              }
            },
            onTapDown: (details) {
              if (!kIsWeb) {
                RenderBox box = context.findRenderObject() as RenderBox;
                Offset localPosition = box.globalToLocal(
                  details.globalPosition,
                );
                _updateCursorPosition(localPosition, box.size);
              }
            },
            child: MouseRegion(
              onHover: (event) {
                _updateCursorPosition(event.localPosition, context.size!);
              },

              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 100,
                    top: 20,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 700,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/me.png'),
                              ),
                              borderRadius: BorderRadius.circular(200),
                            ),
                          ),
                          const Gap(20),
                          const Text(
                            "Ismail Hossain James",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(10),
                          const Text(
                            "Full Stack Flutter App Developer.",
                            style: TextStyle(fontSize: 30, color: Colors.grey),
                          ),
                          const Gap(20),
                          Wrap(
                            spacing: 20,
                            runSpacing: 10,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  launchUrl(
                                    Uri.parse(
                                      'https://github.com/IsmailHosenIsmailJames',
                                    ),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                icon: const Icon(
                                  SimpleIcons.github,
                                  color: Colors.white,
                                ),
                                label: const Text("Github"),
                              ),

                              ElevatedButton.icon(
                                onPressed: () {
                                  launchUrl(
                                    Uri.parse(
                                      'https://www.linkedin.com/in/ismail-hosen-james-3756a4211',
                                    ),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.linkedin,
                                  color: Colors.blue,
                                ),
                                label: const Text("LinkedIn"),
                              ),

                              ElevatedButton.icon(
                                onPressed: () {
                                  launchUrl(
                                    Uri(
                                      scheme: 'mailto',
                                      path:
                                          'md.ismailhosenismailjames@gmail.com',
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.mail, color: Colors.red),
                                label: const Text("Email"),
                              ),

                              ElevatedButton.icon(
                                onPressed: () {
                                  launchUrl(
                                    Uri.parse(
                                      'https://web.facebook.com/IsmailHossainJames',
                                    ),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                icon: const Icon(
                                  SimpleIcons.facebook,
                                  color: Colors.blue,
                                ),
                                label: const Text("Facebook"),
                              ),
                            ],
                          ),
                          const Gap(30),
                          const Text(
                            """Full-Stack Flutter Developer with a passion for crafting engaging mobile experiences and robust backend systems. Experienced in Django, IoT development, and building impactful applications, including educational apps with over 70,000 downloads on Google Play. Currently contributing to innovative projects at Radiant's Impala Intech.""",
                          ),
                          const Gap(50),
                          const Text(
                            "Work Experience",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(50),
                          getProjectCard(
                            name: "ODMS Android App",
                            position: "Main App Developer",
                            date: 'Aug, 2024 - Present',
                            description:
                                "Developed a mission-critical mobile application for Radiant Pharmaceuticals, used daily by over 1000 delivery personnel. The Flutter-based app streamlined medicine deliveries with real-time tracking (WebSocket, dynamic intervals, activity recognition), order management, cash collection, and integrated reporting. Successfully implemented forced version updates, offline capabilities, and data synchronization with Firebase and PostgreSQL, demonstrating expertise in building scalable and reliable mobile solutions.",
                            link:
                                "https://github.com/IsmailHosenIsmailJames/ODMS_app_rdl_radiant",
                          ),
                          const Gap(50),
                          getProjectCard(
                            name: "Al Quran",
                            position: "Main Developer",
                            date: 'Feb, 2024 - Present',
                            description:
                                "Al Quran (Tafsir & Audio) is a Flutter-built, cross-platform (Android, Web, Windows, Linux) application providing global access to the Quran and its interpretations. It features translations in 69 languages (250+ books), Tafsir in 6 languages (30+ books), audio recitations from 40+ reciters, and offline audio playback. The app also includes note-taking, bookmarking, and cloud-based data synchronization. The Android version has achieved significant success with 48,500+ downloads, a 4.7-star rating, and 16,000+ active users (10,500+ daily), demonstrating my proficiency in Flutter, cross-platform development, API integration, data management, and creating user-centered applications. Version 2 is in development, focusing on expanded language support and UI enhancements.",
                            link:
                                "https://github.com/IsmailHosenIsmailJames/al_quran_tafsir_and_audio",
                          ),
                          const Gap(50),
                          getProjectCard(
                            name: "Al Quran Audio",
                            position: "Main Developer",
                            date: 'Dec, 2024 - Present',
                            description:
                                "Announcing the 'Al Quran Audio' app, a special Ramadan gift for Muslims! Experience the Quran with high-quality recitations from 79 world-renowned Qaris. Key features include online streaming for instant access, categorized search to easily find your favorite reciters and Surahs, a favorites playlist to save preferred recitations, and continuous playback that resumes where you left off. The app also displays Tajwid text for correct pronunciation, and offers full audio controls (play, pause, forward, rewind, background playback, lock screen control). Enjoy synchronized text and recitation for focused learning, and a modern, multi-language, user-friendly interface. Available on the Google Play Store and as a web app (link provided). Designed to enhance your Quran learning and listening, especially during Ramadan. Your feedback is highly valued!",
                            link:
                                "https://github.com/IsmailHosenIsmailJames/quran_audio",
                          ),
                          const Gap(50),
                          getProjectCard(
                            name: "Rust Book",
                            position: "Main Developer",
                            date: 'Jan, 2024 - Present',
                            description:
                                "An offline, multi-lingual Android app providing access to \"The Rust Programming Language]\" book in 16 languages. Developed to address the need for offline and localized learning resources for Rust, the app features a user-friendly interface with search, favorites, and dynamic language switching. With 6,000+ downloads and 3,000+ active users, it demonstrates a clear demand for accessible Rust learning materials.",
                            link:
                                "https://github.com/IsmailHosenIsmailJames/rust_book_multi_language",
                          ),
                          const Gap(50),
                          getProjectCard(
                            name: "Exium T20 World Cup",
                            position: "Main App Developer",
                            date: 'Jan, 2024 - Present',
                            description:
                                "A Flutter-based mobile app developed for Exium and Radiant, providing a platform for Doctors and CHQ users to engage with the T20 World Cup. Users can create fantasy teams, track player scores, view live match details, fixtures, and standings, all within a user-friendly interface. The app fulfills all client requirements and includes additional features like in-app updates, caching for offline use, and efficient data management.",
                            link:
                                "https://github.com/IsmailHosenIsmailJames/Exium-Mups-T20-World-Cup",
                          ),
                          const Gap(50),
                          getProjectCard(
                            name: "Jenphar E-Library",
                            position: "Main App Developer",
                            date: 'Jan, 2024 - Present',
                            description:
                                "Jenphar E-Library App: A Flutter-based quiz and learning platform combining interactive quizzes, a leaderboard, and a comprehensive resource library. Developed with a Flutter frontend, Express.js backend, and SQL database, the app allows admins to create and manage quizzes, publish results, and upload PDFs and videos. Users benefit from in-app media viewers for seamless access to learning materials, fostering engagement and competition within educational institutions, organizations, or communities.",
                            link:
                                "https://github.com/IsmailHosenIsmailJames/jenphar_e_library_app",
                          ),
                          const Gap(50),
                          getProjectCard(
                            name: "HR Platform",
                            position: "Main App Developer",
                            date: 'Jun, 2024 - Present',
                            description:
                                "A Flutter and Firebase application combining user management, data management (files/folders), and survey/quiz functionality. Features include user authentication, admin controls, file upload/download, folder organization, survey creation with multiple question types, and in-app updates.",
                            link:
                                "https://github.com/IsmailHosenIsmailJames/hr_platform",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getProjectCard({
    required String name,
    required String position,
    required String date,
    required String description,
    String? link,
  }) {
    return Column(
      children: [
        getProjectTitle(name: name, position: position, date: date, link: link),
        const Gap(20),
        Text(description, textAlign: TextAlign.justify),
      ],
    );
  }

  Widget getProjectTitle({
    required String name,
    required String position,
    required String date,
    String? link,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Gap(5),
            Text(
              position,
              style: TextStyle(fontSize: 18, color: MyAppColors.primaryColor),
            ),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(date, style: const TextStyle(color: Colors.grey)),
            if (link != null)
              TextButton.icon(
                style: TextButton.styleFrom(
                  iconAlignment: IconAlignment.end,
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                    bottom: 5,
                    right: 3,
                  ),
                ),
                onPressed: () {
                  launchUrl(
                    Uri.parse(link),
                    mode: LaunchMode.externalApplication,
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(SimpleIcons.github),
                    Gap(10),
                    Text('Explore'),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
