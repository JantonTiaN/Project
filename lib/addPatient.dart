import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Gender { MALE, FEMALE, OTHER }

class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final cID = TextEditingController();
  final fname = TextEditingController();
  final lname = TextEditingController();
  final address = TextEditingController();
  final drugallergy = TextEditingController();
  final gender = TextEditingController();
  final tel = TextEditingController();
  final email = TextEditingController();

  Gender _genderValue = Gender.MALE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('กรอกประวัติคนไข้'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        // icon: Icon(Icons.person),
                        labelText: "เลขประจำตัวประชาชน*",
                      ),
                      keyboardType: TextInputType.phone,
                      controller: cID,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                    ),
                    Padding(padding: const EdgeInsets.all(10)),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        // icon: Icon(Icons.person),
                        labelText: "ชื่อ*",
                      ),
                      controller: fname,
                    ),
                    Padding(padding: const EdgeInsets.all(10)),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        // icon: Icon(Icons.person),
                        labelText: "นามสกุล*",
                      ),
                      controller: lname,
                    ),
                    Padding(padding: const EdgeInsets.all(10)),
                    // Divider(),

                    Text('เพศ'),
                    RadioListTile(
                      title: const Text('ชาย'),
                      value: Gender.MALE,
                      groupValue: this._genderValue,
                      onChanged: (value) {
                        setState(() => this._genderValue = value);
                      },
                    ),

                    RadioListTile(
                      title: const Text('หญิง'),
                      value: Gender.FEMALE,
                      groupValue: this._genderValue,
                      onChanged: (value) {
                        setState(() => this._genderValue = value);
                      },
                    ),

                    RadioListTile(
                      title: const Text('ไม่ระบุ'),
                      value: Gender.OTHER,
                      groupValue: this._genderValue,
                      onChanged: (value) {
                        setState(() => this._genderValue = value);
                      },
                    ),

                    // Divider(),
                    Padding(padding: const EdgeInsets.all(10)),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        // icon: Icon(Icons.person),
                        labelText: "เบอร์โทรศัพท์*",
                        prefixText: "+66",
                      ),
                      keyboardType: TextInputType.phone,
                      controller: tel,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                    ),
                    Padding(padding: const EdgeInsets.all(10)),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        // icon: Icon(Icons.person),
                        labelText: "ประวัติการแพ้ยา*",
                      ),
                      controller: drugallergy,
                    ),
                    Padding(padding: const EdgeInsets.all(10)),
                    TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        // icon: Icon(Icons.person),
                        labelText: "E-mail",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                    ),
                    Padding(padding: const EdgeInsets.all(10)),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        // icon: Icon(Icons.person),
                        labelText: "ที่อยู่",
                      ),
                      controller: address,
                    ),
                    Padding(padding: const EdgeInsets.all(10)),
                    RaisedButton(
                      child: Text("ยืนยัน"),
                      color: Colors.blue[300],
                      onPressed: () {
                        if (cID.text == "" ||
                            fname.text == "" ||
                            lname.text == "" ||
                            tel.text == "" ||
                            drugallergy.text == "") {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('เกิดข้อผิดพลาด'),
                              content: Text(
                                'กรุณากรอกข้อมูลให้ครบ',
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('ยกเลิก'),
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                ),
                                FlatButton(
                                  child: Text('ตกลง'),
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                )
                              ],
                            ),
                          );
                        } else {}
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
