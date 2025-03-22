import 'package:flutter/material.dart';
import 'package:flutter1/Screen/page_get_login.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class PageSimpleLogin extends StatefulWidget {
  const PageSimpleLogin({super.key});

  @override
  State<PageSimpleLogin> createState() => _PageSimpleLoginState();
}

class _PageSimpleLoginState extends State<PageSimpleLogin> {

  TextEditingController etUsername = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();

  String nUsername = "";
  String nPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page Login',
            style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.red[900],
        ),
        body: Form(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10),
                child: Text(
                  'Form Login User',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: etUsername,
                decoration: InputDecoration(hintText: 'input username'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: etPassword, //proses get data
                obscureText: true, //biar password tidak kelihatan
                decoration: InputDecoration(hintText: 'input password'),
              ),

              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: (){

                  setState(() {
                    nUsername = etUsername.text;
                    nPassword = etPassword.text;

                    showToast(
                      "Username: $nUsername\nPassword: $nPassword",
                      context: context,
                      animation: StyledToastAnimation.fade,
                      reverseAnimation: StyledToastAnimation.fade,
                      position: StyledToastPosition.bottom,
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.black54,
                      textStyle: TextStyle(color: Colors.white),
                      borderRadius: BorderRadius.circular(8.0),
                    );

                    print("username : " + nUsername + "  pass : " + nPassword);
                    //Task
                    //Tampilkan username dan password ke dalam bentuk toast
                    //pindah ke page halaman selanjutnya dan menampilkan atau
                    //pasing data dari username dan password

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageGetLogin(nUsername, nPassword)),
                    );
                  });
                },
                color: Colors.purple,
                textColor: Colors.white,
                child: Text('Login'),
              ),



            ],
          ),)

    );

  }
}