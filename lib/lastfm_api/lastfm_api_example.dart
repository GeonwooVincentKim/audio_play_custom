import 'package:flutter/material.dart';
import 'package:music_player/lastfm_api/lastfm.dart';
import 'package:music_player/lastfm_api/lastfm_api_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LastFM Example',
      theme: ThemeData(primaryColor: Colors.amber),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      // routes: {

      // },
      // onGenerateRoute: (settings) {
        
      // },
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<LastFm>> getLastFmList = ApiService.getLastFm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.black26,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder(
            future: getLastFmList,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var musicSummary = snapshot.data![index];
                    return LastFmListView(lastFm: musicSummary);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 12);
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator()
              );
            },
          )
        ),
      ),
    );
  }
}

class LastFmListView extends StatelessWidget {
  final LastFm lastFm;
  
  const LastFmListView({
    super.key,
    required this.lastFm
  });


  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        color: Colors.amberAccent,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(lastFm.artist),
            Text(lastFm.name),
            Text(lastFm.url)
          ],
        )
      ),
    );
  }
}
