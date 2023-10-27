import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AfficheFormulaire extends StatefulWidget {
  final List<String> sexe;
  final String date;
  final int pivotSexe;
  final double taille;
  final List<Map<String, dynamic>> techno;

  final String nom;
  final String prenom;
  final String loisires;
  const AfficheFormulaire(
      {super.key,
      required this.date,
      required this.loisires,
      required this.nom,
      required this.prenom,
      required this.sexe,
      required this.pivotSexe,
      required this.taille,
      required this.techno});

  @override
  State<AfficheFormulaire> createState() => _AfficheFormulaireState();
}

class _AfficheFormulaireState extends State<AfficheFormulaire> {
  String? path;
  String? pathCouv;
  XFile? image;
  List<String> techno = [];

  List<String> loisires = [];
  void tech() {
    for (int i = 0; i < widget.techno.length; i++) {
      setState(() {
        if (widget.techno[i]['isCheck'] == true) {
          techno.add(widget.techno[i]['nom']);
        }
      });
    }

    loisires = widget.loisires.split(',');
  }

  Future<XFile?> pickImage() async {
    final picker = ImagePicker();

    return await picker.pickImage(source: ImageSource.gallery);
    //  ou gallery
  }

  Future<String?> pickedFile() async {
    final pickedFile = await pickImage();

    if (pickedFile != null) {
      setState(() {
        path = pickedFile.path;
      });
    }
    return null;
  }

  Future<XFile?> pickImageCouv() async {
    final picker = ImagePicker();

    return await picker.pickImage(source: ImageSource.gallery);
    //  ou gallery
  }

  Future<String?> pickedFileCouv() async {
    final pickedFile = await pickImage();

    if (pickedFile != null) {
      setState(() {
        pathCouv = pickedFile.path;
      });
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tech();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Color.fromARGB(255, 218, 218, 218),
        ),
        Stack(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: pathCouv != null
                            ? Image.file(
                                File(pathCouv!),
                                fit: BoxFit.cover,
                              )
                            : const Padding(
                                padding: EdgeInsets.all(28.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Selectionnez une photos',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 250,
              // color: Colors.amber,

              // width: double.infinity,
              // color: Colors.amber,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 116, 116, 116),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 5, color: Colors.white)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: path != null
                            ? Image.file(
                                File(path!),
                                fit: BoxFit.cover,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Selectionnez une photos',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(108.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        child: IconButton(
                          onPressed: () {
                            pickedFile();
                          },
                          icon: const Icon(Icons.add_a_photo,
                              size: 30, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        child: IconButton(
                          onPressed: () {
                            pickedFileCouv();
                          },
                          icon: const Icon(Icons.photo_camera,
                              size: 30, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.all(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.orange,
            border: Border.all(
                color: Colors.white, width: 3, style: BorderStyle.solid),
          ),
          child: Center(
            child: Text(
              'Mes informations',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('NOM :'), Text(widget.nom)],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('PRENOM :'), Text(widget.prenom)],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('TAILLE :'), Text('${widget.taille} cm')],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('DATE:'), Text(widget.date)],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('LOISIRES:'),
                    Container(
                      child: Column(
                          children: loisires.map((t) {
                        return Text(t);
                      }).toList()),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SEXE:'),
                    Text(widget.sexe[widget.pivotSexe])
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TECHNOLOGIE:'),
                    Container(
                      child: Column(
                          children: techno.map((t) {
                        return Text(t);
                      }).toList()

                          //  [
                          //   widget.techno[0]['isCheck'] == true
                          //       ? Text(widget.techno[0]['nom'])
                          //       : Text(''),
                          //   widget.techno[1]['isCheck'] == true
                          //       ? Text(widget.techno[1]['nom'])
                          //       : Text(''),
                          //   widget.techno[2]['isCheck'] == true
                          //       ? Text(widget.techno[2]['nom'])
                          //       : Text('')
                          // ],
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
