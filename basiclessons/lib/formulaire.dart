import 'package:basiclessons/affiche_formulaire.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  List<String> sexe = ['feminin', 'masculin'];

  List<Map<String, dynamic>> techno = [
    {'nom': 'flutter', 'isCheck': false},
    {'nom': 'java', 'isCheck': false},
    {'nom': 'kotlin', 'isCheck': false}
  ];

  bool active = false;
  int pivotSexe = 0;
  double min = 0;
  double max = 200;
  double value = 100;

  TextEditingController dateInput = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController loisirController = TextEditingController();

  String date = "";

  String nom = '';
  String prenom = '';
  String loisires = '';

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }
  // Widget radioSexe() {

  //   return;  for (var i = 0; i < sexe.length; i++) {
  //      ListTile(

  //         ) ;
  //    } ;
  //      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Run',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star,color: Colors.white),
          ),
        ],
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Color.fromARGB(255, 222, 222, 222),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.orange,
                border: Border.all(
                    color: Colors.white, width: 3, style: BorderStyle.solid),
              ),
              child: Center(
                child: const Text(
                  'Bienvenue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: nomController,
                decoration: InputDecoration(
                    hintText: 'Votre nom',
                    labelText: 'Nom',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: prenomController,
                decoration: InputDecoration(
                    hintText: 'Votre prenom',
                    labelText: 'Prenom',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            Container(
              // color: Colors.amber,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              //  height: 100,
              // margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text('Sexe :'),
                  Radio(
                    value: 0,
                    groupValue: pivotSexe,
                    onChanged: (val) {
                      setState(() {
                        pivotSexe = val!;
                      });
                    },
                  ),
                  Text(sexe[0]),
                  Radio(
                    value: 1,
                    groupValue: pivotSexe,
                    onChanged: (val) {
                      setState(() {
                        pivotSexe = val!;
                      });
                    },
                  ),
                  Text(sexe[1]),
                ],
              ),
            ),
            Column(
              children: [
                Text('Votre taille est : ${value.toInt()} cm'),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text('Taille'),
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
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text('Technologie :'),
                  Column(
                    children: [
                      Container(
                        child: Checkbox(
                            value: techno[0]['isCheck'],
                            onChanged: (newValue) {
                              setState(() {
                                techno[0]['isCheck'] = newValue;
                              });
                            }),
                      ),
                      Text(techno[0]['nom']),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Checkbox(
                            value: techno[1]['isCheck'],
                            onChanged: (newValue) {
                              setState(() {
                                techno[1]['isCheck'] = newValue;
                              });
                            }),
                      ),
                      Text(techno[1]['nom']),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Checkbox(
                            value: techno[2]['isCheck'],
                            onChanged: (newValue) {
                              setState(() {
                                techno[2]['isCheck'] = newValue;
                              });
                            }),
                      ),
                      Text(techno[2]['nom']),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.width / 3,
                child: Center(
                    child: TextField(
                  controller: dateInput,
                  //editing controller of this TextField
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Votre date de naissance" //label text of field
                      ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));
                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateInput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                ))),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: loisirController,
                decoration: InputDecoration(
                    hintText: 'Votre loisirs',
                    labelText: 'Loisirs',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            Container(
              child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      nom = nomController.text;
                      prenom = prenomController.text;
                      date = dateInput.text;

                      loisires = loisirController.text;

                      active = true;
                    });
                  },
                  child: const Text('Save')),
            ),

            active == true
                ? AfficheFormulaire(
                    techno: techno,
                    taille: value,
                    nom: nom,
                    prenom: prenom,
                    date: date,
                    loisires: loisires,
                    sexe: sexe,
                    pivotSexe: pivotSexe,
                  )
                : const Text('En attente de votre reponse'),
            // SingleChildScrollView(child: Container(child: AfficheFormulaire() ,)) ,
          ],
        ),
      ),
    );
  }
}
