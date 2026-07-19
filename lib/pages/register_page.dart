import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/note_page.dart';
import 'package:first_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text("Register Page"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome in our app ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                //email text filed
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.mail),
                    label: Text("Email"),
                    hint: Text("Please enter you email"),

                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter Your Email";
                    } else if (!value.contains('@')) {
                      return "please enter email with @ ";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),

                //password text filed
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hint: Text("Please enter password"),
                    label: Text("Password"),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.password),
                  ),
                  validator: (value) {
                    if (value!.length < 8) {
                      return "please enter strong password";
                    }
                    return null;
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Already have an account?"),
                ),

                SizedBox(height: 32),

                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      debugPrint("Mail${emailController.text}");
                      debugPrint("Password:${passwordController.text}");
                      //---------------------------------SignUP -----------------------------------------------

                      var statusCode =
                          await AuthService.createUserWithEmailAndPassword(
                            mail: emailController.text,
                            password: passwordController.text,
                          );

                      //-----------------------------------------------
                      if (statusCode == "success") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotesScreen(),
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
