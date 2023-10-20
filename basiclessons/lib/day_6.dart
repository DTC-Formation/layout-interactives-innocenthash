import 'package:flutter/material.dart';

class Day6 extends StatefulWidget {
  const Day6({super.key});

  @override
  State<Day6> createState() => _Day6State();
}

class _Day6State extends State<Day6> {
  double value = 50;
  double min = 0;
  double max = 100;
  bool isTrue = true;
  int? selection = 0;
  List<String> semaine = ['lundi', 'mardi'];

  Widget colorText() {
    return isTrue == true ? Text('Allumer') : Text('etteindre');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('interagir')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('valeur du slider $value'),
            Text('valeur exacte ${value.toInt()}'),
            Container(
              child: Row(
                children: [
                  Text(min.toString()),
                  Expanded(
                    child: Slider(
                        value: value,
                        onChanged: (newValue) {
                          setState(() {
                            value = newValue;
                          });
                        },
                        min: min,
                        max: max),
                  ),
                  Text(max.toString())
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  colorText(),
                  Switch(
                      value: isTrue,
                      onChanged: (bool newValue) {
                        setState(() {
                          isTrue = newValue;
                        });
                      })
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                color: Colors.amber,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                       Text(semaine[selection!]),
                        Expanded(
                          child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Radio(
                                  value: index,
                                  groupValue: selection,
                                  onChanged: (select) {
                                   setState(() {
                                      selection = select;
                                   });
                                  }),
                                    
                                  title: Text(semaine[index]),
                            );
                          },
                          separatorBuilder: ((context, index) => Divider()),
                          itemCount: semaine.length),
                        ),
                      ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
