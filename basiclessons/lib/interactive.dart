import 'package:flutter/material.dart';

class Interactive extends StatefulWidget {
  const Interactive({super.key});

  @override
  State<Interactive> createState() => _InteractiveState();
}

class _InteractiveState extends State<Interactive> {
  String name = "toto";
  bool v = true;
  Color text = Colors.black;
  Color modeNuit = const Color.fromARGB(255, 255, 255, 255);

  // cycle de vie 1 apres hot restart
  @override
  void initState() {
    name = "bob";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (v) {
      modeNuit = const Color.fromARGB(255, 255, 255, 255);
      text = Colors.black;
    } else {
      modeNuit = Colors.black;
      text = const Color.fromARGB(255, 255, 255, 255);
    }
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive'),
      ),
      backgroundColor: modeNuit,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 50,
            width:double.maxFinite,
            child: Text(
              name,
              style: TextStyle(color: text, fontSize: 20),
            ),
          ),
         
          TextButton(
            onPressed: () {},
            child: const Text('hello'),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.place),
          ),
          const Text(
            'nom',
            textAlign: TextAlign.left,
          ),
          const TextField(),
          const Text(
            'votre numero',
            textAlign: TextAlign.left,
          ),
          const TextField(keyboardType: TextInputType.number),
          const Text(
            'prenom',
            textAlign: TextAlign.left,
          ),
          //  placeholder
          const TextField(
              decoration: InputDecoration(hintText: 'votre prenom')),
          //  pour cacher le text
          const Text('mot de pass', textAlign: TextAlign.left),
          const TextField(
            obscureText: true,
          ),

          TextField(
            onSubmitted: (value) {
              print("jsnjq");
            },
          )
        ],
      ),

      
    );
  }
}
