import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dosen extends StatefulWidget {
  const Dosen({super.key});

  @override
  State<Dosen> createState() => _DosenState();
}

class _DosenState extends State<Dosen> {

  TextEditingController nidn = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController tgllahir = TextEditingController();
  TextEditingController alamat = TextEditingController();
  String? valPendidikan, valStatus, inputForm;
  final _formKey = GlobalKey<FormState>();


  Future selectDate() async{
    DateTime? pickDate = await showDatePicker(
        context: context,
        firstDate: DateTime(1950),
        lastDate: DateTime(2100),
        initialDate: DateTime.now()

    );
    if(pickDate!=null){
      tgllahir.text = DateFormat("dd-MM-yyyy").format(pickDate);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Form Dosen",style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 15,),
                CostumeInput(
                    labelInput: "NIDN",
                    controller: nidn,
                    hintText: "2301093014",
                    textInputType: TextInputType.name),
                SizedBox(height: 15,),
                CostumeInput(
                    labelInput: "Fullname",
                    controller: fullname,
                    hintText: "Dion Wiyoko",
                    textInputType: TextInputType.name),
                SizedBox(height: 15,),
                CostumeInput(
                  labelInput: "Tanggal Lahir",
                  controller: tgllahir,
                  hintText: "dd/mm/YYYY",
                  textInputType: TextInputType.datetime,
                  onTap: (){
                    selectDate();
                  },
                ),
                SizedBox(height: 15,),
                Text("Pendidikan",style: TextStyle(fontSize: 18),),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: valPendidikan,
                    underline: Container(),
                    isExpanded: true,
                    items: [
                      "S1",
                      "S2",
                      "S3",
                    ].map((e){
                      return DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        valPendidikan = val;
                      });
                    },

                  ),
                ),
                SizedBox(height: 15,),
                Text("Status",style: TextStyle(fontSize: 18),),
                SizedBox(height: 5,),
                Row(
                  children: [
                    CostumeRadio(value: 'Menikah', groupValue: valStatus.toString(), onChange: (val){setState(() {
                      valStatus = val;
                    });
                    },
                    ),

                    CostumeRadio(value: 'Single', groupValue: valStatus.toString(), onChange: (val){setState(() {
                      valStatus = val;
                    });
                    },
                    ),

                  ],
                ),
                SizedBox(height: 15,),
                CostumeInput(
                    labelInput: "Alamat",
                    controller: alamat,
                    hintText: "Jl. Sutan Syahrir",
                    textInputType: TextInputType.name),
                SizedBox(height: 15,),
                CostumeButton(
                    bgcolor: Colors.green,
                    labelButton: "Save",
                    onPressed: (){
                      setState(() {
                        //cek validasi input
                        if(_formKey.currentState!.validate()){
                          // if(valJK)
                          if(valPendidikan != null && valStatus != null){
                            //ambil input//
                            inputForm = "NIDN : ${nidn.text}\n"
                                "Fullname : ${fullname.text}\n"
                                "Tanggal Lahir : ${tgllahir.text}\n"
                                "Pendidikan : ${valPendidikan.toString()}\n"
                                "Status : ${valStatus.toString()}\n"
                                "Alamat : ${alamat.text}";
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  inputForm.toString(),
                                ),
                              ),
                            );

                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Silahkan Pilih Agama dan Jenis Kelamin")));
                          }
                        }
                      });
                    },
                    labelColor: Colors.white),
              ],

            ),
          ),

        ),
      ),
    );
  }
}

class CostumeInput extends StatelessWidget {
  final String labelInput;
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final VoidCallback? onTap;

  const CostumeInput({super.key,
    required this.labelInput,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.obscureText = false,
    this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelInput,style: TextStyle(fontSize: 18),),
        SizedBox(height: 5,),
        TextFormField(
          controller: controller, //Mendapatkan Input dari User
          validator: (val){
            return val!.isEmpty ? "Input tidak boleh kosong" : null;
          },
          decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ),
          keyboardType: textInputType,
          obscureText: obscureText ,
          onTap: (){
            onTap?.call();
            //event ketika klik input
          },
        )
      ],
    );
  }
}

class CostumeRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String> onChange;
  const CostumeRadio(
      {
        super.key,
        required this.value,
        required this.groupValue,
        required this.onChange
      });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child:
      RadioListTile(
        value: value,
        groupValue: groupValue,
        onChanged: (val){
          if(val != null){
            onChange(val);
          }
        },
        title: Text(value),
      ),

    )
    ;
  }
}

class CostumeButton extends StatelessWidget {
  final Color bgcolor;
  final   String labelButton;
  final VoidCallback onPressed;
  final Color labelColor;

  const CostumeButton({
    super.key,
    required this.bgcolor,
    required this.labelButton, required this.onPressed,
    required this.labelColor, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: bgcolor
        ) ,
        onPressed: () {
          onPressed.call();
        },
        child: Text(labelButton, style: TextStyle(color: labelColor),)
    );
  }
}