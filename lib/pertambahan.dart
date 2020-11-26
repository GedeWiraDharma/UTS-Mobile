import 'package:flutter/material.dart';

class KalkulatorTambah extends StatefulWidget {
  @override
  KalkulatorTambahState createState() => KalkulatorTambahState();
}

class KalkulatorTambahState extends State<KalkulatorTambah> {
  //Registrasi kontoler anggo text field
  final kontrol_A = TextEditingController();
  final kontrol_B = TextEditingController();
  final form_key = GlobalKey<FormState>();

  String hasil = ""; //anggo menampilkan hasil
  //funsgi pertambahan
  void Pertambahan() {
    if (form_key.currentState.validate()) {
      int var_A = int.parse(kontrol_A.text);
      int var_B = int.parse(kontrol_B.text);
      int result = var_A + var_B;
      setState(() {
        hasil = "$result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Pertambahan'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Form(
            key: form_key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  //Field text 1 anggo kontroler A,
                  controller: kontrol_A,
                  //validasi untuk memastikan bahwa kotak sudah diisi
                  validator: (value) {
                    if (value.isEmpty)
                      return "Tolong Masukan Angka Terlebih Dahulu";
                  },
                  decoration: InputDecoration(
                    hintText: "Silahkan Masukan Angka",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: kontrol_B,
                  //validasi untuk memastikan bahwa kotak sudah diisi
                  validator: (value) {
                    if (value.isEmpty)
                      return "Tolong Masukan Angka Terlebih Dahulu";
                  },
                  decoration: InputDecoration(
                    hintText: "Silahkan Masukan Angka",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 100,
                    child: Text(
                      hasil,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey)),
                RaisedButton(
                  onPressed: Pertambahan,
                  child: Text("Tambahkan"),
                )
              ],
            )),
      ),
    );
  }
}
