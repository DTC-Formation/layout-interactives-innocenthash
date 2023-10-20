import 'package:basiclessons/day_6.dart';
import 'package:basiclessons/formulaire.dart';
import 'package:basiclessons/interactive.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        
        // backgroundColor: Color
      ),
      
      debugShowCheckedModeBanner: false,
      home: Formulaire(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

// propre a la class fils pour eviter que ce celle du mere qu'on appelle
  @override
  Widget build(BuildContext context) {
    // on precise text satria widget type texte no type retourner 
    Text customText(String data) {
      return Text(
            data,
            style:const TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.center,
          );
    }
    // eto mi declacrer variable avant build  rehefa statefull no ambony

//  maka information ecran height sy width

    var size = MediaQuery.of(context).size;
    //  SCELLETTE application c'est un widget
    return Scaffold(
      appBar: AppBar(
        title: customText('veve bonjour'),
      ),
      // backgroundColor: Color.fromARGB(66, 255, 240, 240),
      body: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expanded(
          //   child: Image.network('https://images.pexels.com/photos/18497824/pexels-photo-18497824/free-photo-of-mode-gens-femme-ete.jpeg'
          //   ,height: 200,width: 200,),
          // ) ,
          Expanded(
            child: Center(
            child: RichText(
                  // Controls visual overflow
                  overflow: TextOverflow.fade,
           
                  // Controls how the text should be aligned horizontally
                  textAlign: TextAlign.center,
           
                  // Control the text direction
                  textDirection: TextDirection.rtl,
           
                  // Whether the text should break at soft line breaks
                  softWrap: true,
           
                  // Maximum number of lines for the text to span
                  maxLines: 6,
           
                  // The number of font pixels for each logical pixel
                  textScaleFactor: 1,
                  text: TextSpan(
            text: 'Good ',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                  text: 'Inno', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
                  ),
                )),
          ),
      // backgroundColor: Colors.lightBlue[50],
    // ),
    const Spacer(flex: 5,),
     const Divider(color: Colors.black,endIndent: 12, indent: 12,) ,


          Container(
          // margin: const EdgeInsets.all(50),
          padding: const EdgeInsets.all(1),
          // color: const Color.fromARGB(255, 0, 255, 51),
          height: 100,
          width: double.infinity,
          child:  Card(
            elevation: 5,
            child: Center(
              child: customText('veve bonjour') ,
            ),
          ),
        ),
          Container(
          // margin: const EdgeInsets.all(50),
          padding: const EdgeInsets.all(1),
          color: Colors.orange,
          height: 50,
          width: 200,
          child:  Center(
            child: customText('veve bonjour') ,
          ),
        ),
        Container(
          // margin: const EdgeInsets.all(50),
          padding: const EdgeInsets.all(1),
          color: Colors.purple,
          height: 50,
          width: size.width,
          child:  Center(
            child: customText('vevi bonjour') ,
          ),
        ),
         Container(
          // margin: const EdgeInsets.all(50),
          padding: const EdgeInsets.all(1),
          color: Colors.orange,
          height: 50,
          width: 200,
          child:  Center(
            child: customText('vevi bonjour') ,
          ),
        ),
        ] ,
      ),
    );
  }
}
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();

