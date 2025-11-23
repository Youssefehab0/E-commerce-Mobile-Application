import 'package:e_comrcee_with_api_with_gad/Providers/AuthProvider.dart';
import 'package:e_comrcee_with_api_with_gad/Screens/login_page.dart';
import 'package:e_comrcee_with_api_with_gad/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp  Page"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                child: Icon(Icons.account_circle, color: Colors.teal, size: 130),
              ),
              SizedBox(height: 5,),
              Customtextfield(
                ispass: false,
                text1: "Name",
                text2: "Enter Your Name",
                nameController: nameController,
                valid: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Your Name";
                  }
                  return null;
                },
                icon: Icons.account_box,
                keyboard: TextInputType.name,
              ),
              SizedBox(height: 5,),
              Customtextfield(
                ispass: false,
                text1: "Contant",
                text2: "Enter Your Contant",
                nameController: contactController,
                valid: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Your email";
                  }
                  return null;
                },
                icon: Icons.phone,
                keyboard: TextInputType.phone,
              ),
              SizedBox(height: 5,),
              Customtextfield(
                ispass: false,
                text1: "Email",
                text2: "Enter Your email",
                nameController: emailController,
                valid: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Your email";
                  }
                  if (!value.contains("@")) {
                    return "Your email should Contains @";
                  }
                  return null;
                },
                icon: Icons.email,
                keyboard: TextInputType.emailAddress,
              ),
              SizedBox(height: 5,),
              Customtextfield(
                ispass: true,
                text1: "Password",
                text2: "Enter Your Password",
                nameController: PasswordController,
                valid: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Your Password";
                  }
                  if (value.length < 8) {
                    return "Your Password should Contains 8 chars";
                  }
                  if (value == value.toUpperCase()) {
                    return "Your Password should Contains At least on char upper";
                  }
                  return null;
                },
                icon: Icons.lock,
                keyboard: TextInputType.visiblePassword,
              ),
              SizedBox(height: 5,),
              Consumer<Authprovider>(builder: (context, value, child) {
                return ElevatedButton(onPressed: ()async{
                  if(formkey.currentState!.validate())
                  {
                    await value.SignUp(name: nameController.text, contact: contactController.text, email: emailController.text, password: PasswordController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text(value.model?.message??"Login Faild")),
                    );
                    if(value.model!.status == true)
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(userId: value.model!.userId,),));
                    }
                  }
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),));
              },),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              }, 
                child: Text("Already have an Account? Login",),
              )
            ],
          ),
        ),
      ),
    );
  }
}