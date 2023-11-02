import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Gallery'),
              Tab(text: 'Audio'),
              Tab(text: 'Video'),
            ],
          ),
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: [
             GalleryPage(),
             AudioPage(),
             VideoPage(),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('My App'),
          ),
          ListTile(
            title: Text('Gallery'),
            onTap: () {
              // Navigate to the Gallery Page
              GalleryPage();
             // Navigator.of(context).pop();

            },
          ),
          ListTile(
            title: Text('Audio'),
            onTap: () {
              // Navigate to the Audio Page
            },
          ),
          ListTile(
            title: Text('Video'),
            onTap: () {
              // Navigate to the Video Page
            },
          ),
        ],
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
    return Scaffold(
      body: Center(
        child: Text('Audio Page with Dummy Data'),
      ),
    );
  }
}

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Video Page with Dummy Data'),
      ),
    );
  }
}