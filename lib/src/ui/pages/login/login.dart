import 'package:appdelivery/src/ui/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  static Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
  }) async{

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email, password: password);
        user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if(e.code =='user-not-found'){
        print('================== Usuario no encontrado =======================');
      }
      if(e.code=='wrong-password'){
        print('============ Contraseña imcorrecta ==================');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login to Your App',style: 
              TextStyle(color: Colors.black,fontSize: 44,fontWeight: FontWeight.bold)),
            SizedBox(height: 44.0),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "User Email",
                prefixIcon: Icon(Icons.mail,color: Colors.black)
              ),
            ),
            SizedBox(height: 44.0),
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "User Password",
                prefixIcon: Icon(Icons.lock,color: Colors.black)
              ),
            ),
            SizedBox(height: 12.0),
            Text('Dont Rememeber your Password',
              style: TextStyle(color:Colors.blue)),
            SizedBox(height: 88.0),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Colors.blueAccent,
                elevation: 0.0,
                padding: EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)
                ),
                onPressed: () async{

                  User? user = await loginUsingEmailPassword(
                    email: _emailController.text, password: _passwordController.text
                    );

               
                  if(user != null){
                    print('=============================');
                    print(user.uid);
                    print(user.email);
                    print('=============================');
                    Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context)=>HomePage()));
                  }
                  
                },
                child: Text('Login',
                       style: TextStyle(color: Colors.white))
                       
              )
            )

          ],
        ),
      ),
    
    );
  }
}