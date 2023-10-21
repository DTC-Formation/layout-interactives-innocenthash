import 'package:flutter/material.dart';

class AfficheFormulaire extends StatefulWidget {
  final List<String> sexe;
  final String date;
  final int pivotSexe;
  final double taille;
  final int? poid;
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
      required this.techno ,
      required this.poid});

  @override
  State<AfficheFormulaire> createState() => _AfficheFormulaireState();
}

class _AfficheFormulaireState extends State<AfficheFormulaire> {
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
              // width: double.infinity,
              child: Image.asset('assets/svetjekolem--js8KGQLfhw-unsplash.jpg'),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 250,
              // width: double.infinity,
              // color: Colors.amber,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ClipOval(
                    child: Image.asset(
                  'assets/arteum-ro-oaMFDtSqHXY-unsplash.jpg',
                  cacheHeight: 100,
                  cacheWidth: 100,
                )),
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
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('POID:'),
                          Text(widget.poid.toString())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
               Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('POID:'),
                          Text('${widget.poid.toString()} kg')
                        ],
                      ),
                    ),

                     Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('IMC:'),
                          Text((widget.poid!/widget.taille).toString())
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
