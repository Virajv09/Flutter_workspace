import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [GalleryPage(), AudioPage(), VideoPage()];

  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Navigation App'),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.audiotrack),
              label: 'Audio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videocam),
              label: 'Video',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class GalleryPage extends StatelessWidget
{
  List<String> images = [
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
  ];

  @override
  Widget build(BuildContext context)
  {
    return GridView.builder(  itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0
        )


        , itemBuilder:(BuildContext context,int index)
        {

          return Image.network(images[index]);

        });


  }

}

class AudioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Audio Page'),
    );
  }
}

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Video Page'),
    );
  }
}