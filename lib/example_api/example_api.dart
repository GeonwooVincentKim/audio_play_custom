import 'package:flutter/material.dart';
import 'package:music_player/example_api/api_service.dart';
import 'package:music_player/example_api/music_data_response.dart';
import 'package:music_player/example_api/music_detail.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "Home Page",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MusicDataResponse> musicList = [];

  @override
  void initState() {
    super.initState();
    fetchMusicData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Music App"),
        ),
        body: customListCard());
  }

  Future<void> fetchMusicData() async {
    final musiclist = await ApiService().getAllFetchMusicData();
    setState(() {
      musicList = musiclist;
    });
  }

  Widget customListCard() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MusicDetailPage(response: musicList[index]),
                ));
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, bottom: 8, right: 8, top: 4),
                  child: SizedBox(
                    child: FadeInImage.assetNetwork(
                        height: 60,
                        width: 60,
                        placeholder: "lib/assets/images/musicplaceholder.png",
                        image: musicList[index].image.toString(),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      musicList[index].title.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      musicList[index].artist.toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      itemCount: musicList.length,
    );
  }
}