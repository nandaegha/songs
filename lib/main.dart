import 'package:flutter/material.dart';
import 'dart:math';

Random random = new Random();

var songs = [
  'Terus Melangkah',
  'Separuh Aku',
  'Syukuri Apa Adanya',
  'Tendangan Dari Langit',
  'Lagu Galau',
];

var artist = [
  'Peterpan',
  'Noah',
  'Dmasiv',
  'Kotak',
  'Yowis Ben',
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("MuzicApp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: Image(
                    image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/895/422/420/ultraman-hero-hd-wallpaper-preview.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPadding(
                padding: new EdgeInsets.all(10.0),
                sliver: new SliverList(
                  delegate: new SliverChildListDelegate([
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        new Tab(icon: new Icon(Icons.audiotrack), text: "Songs"),
                        new Tab(icon: new Icon(Icons.collections), text: "Gallery"),
                        new Tab(icon: new Icon(Icons.playlist_add_check), text: "PlayList"),
                      ],
                    ),
                  ]),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Center(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 80,
                        child: Card(
                          child: ListTile(
                            title: Text(
                              '${index + 1}.' + ' ' + '${songs[random.nextInt(songs.length)]}' + ' - ' + '${artist[random.nextInt(artist.length)]}',
                              style: TextStyle(color: Colors.black, fontSize: 24.0),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Center(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(10, (index) {
                    return Container(
                      child: Card(
                        color: Colors.deepPurpleAccent,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('https://www.teahub.io/photos/full/66-664768_figuarts-ultraman-x-ultraman-x-gomora-armor-set.jpg'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          child: ListTile(
                            title: Text(''),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Center(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 80,
                        child: Card(
                          child: ListTile(
                            title: Text(
                              'Lagu Lokal',
                              style: TextStyle(color: Colors.black, fontSize: 24.0),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;

  double get minExtent => _tabBar.preferredSize.height;
  double get maxExtent => _tabBar.preferredSize.height;

  Widget build(BuildContext context, double shrinkOffset, bool overlabsContents) {
    return new Container(
      child: _tabBar,
    );
  }

  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
