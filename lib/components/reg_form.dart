import 'package:flt_challenge/constants/app_constants.dart';
import 'package:flutter/material.dart';

class RegForm extends StatefulWidget {
  const RegForm({super.key});

  @override
  RegFormState createState()  {
    return RegFormState();
  }
}

class RegFormState extends State<RegForm> {

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showFailure = false;

  // global key that uniquely identifies the Form widget and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            validator: (value) {
              if(value == null  || value.isEmpty){
                return "Please Enter your username";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              labelText: 'User Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height:18),
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if(value == null  || value.isEmpty){
                return "Please Enter your email address.";
              } else if(!AppConstants.emailRegex.hasMatch(value)){
                return "Please Enter a valid email address";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppConstants.primaryColor),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                )
              ),
                onPressed: (){
              if(_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logging you in.'))
                );
              }
            }, child:const Expanded(flex: 1,  child: Text('Register', style: TextStyle(fontWeight: FontWeight.w900),),),),
          )
        ],
      ),
    );
  }
}