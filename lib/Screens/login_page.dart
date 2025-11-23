import 'package:e_comrcee_with_api_with_gad/Providers/AuthProvider.dart';
import 'package:e_comrcee_with_api_with_gad/Screens/SignUp_page.dart';
import 'package:e_comrcee_with_api_with_gad/Screens/homepage.dart';
import 'package:e_comrcee_with_api_with_gad/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
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
                    await value.Login(email: emailController.text, password: PasswordController.text);
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
                child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),));
              },),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
              }, 
                child: Text("Don't have an Account? SignUp",),
              )
            ],
          ),
        ),
      ),
    );
  }
}
