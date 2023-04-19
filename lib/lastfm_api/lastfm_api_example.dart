import 'package:flutter/material.dart';

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
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 20,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding (
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  color: Colors.amberAccent,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Center(child: Text("box $index"))  
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
          ),
        ),
      ),
    );
  }
}
