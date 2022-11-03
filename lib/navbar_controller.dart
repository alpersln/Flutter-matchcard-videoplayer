import 'package:flutter/material.dart';
import 'package:flutter_homework_mediaplayer_cardgame/screens/memory_game.dart';
import 'package:flutter_homework_mediaplayer_cardgame/screens/video_player_sample.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController();

  /// initializing controller for PageView

  var _selectedItem = 0;
  void tabChanger(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  List<Widget> tabbarScreens = [
    MemoryGame(),
    VideoPlayerSample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: tabChanger,
        controller: controller,
        children: tabbarScreens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedItem,
        onTap: (index) {
          controller.jumpToPage(index);

          /// Switching the PageView tabs
          setState(() {
            _selectedItem = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.games,
                size: 32,
              ),
              label: "Game"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle,
                size: 32,
              ),
              label: "Player"),
        ],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
