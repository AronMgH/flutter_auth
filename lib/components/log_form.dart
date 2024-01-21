import 'package:flt_challenge/constants/app_constants.dart';
import 'package:flutter/material.dart';

class LgForm extends StatefulWidget {
  const LgForm({super.key});

  @override
  LgFormState createState()  {
    return LgFormState();
  }
}

class LgFormState extends State<LgForm> {

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // bool showFailure = false;
  bool _showPassword = false;

  // global key that uniquely identifies the Form widget and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility(){
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 12),
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
          const SizedBox(height: 18),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if(value == null  || value.isEmpty){
                return "Please Enter your password.";
              }
              return null;
            },
            obscureText: _showPassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(onPressed: togglePasswordVisibility, icon:  false ? const Icon(Icons.visibility): const Icon(Icons.visibility_off),),
              contentPadding: const EdgeInsets.all(8),
              labelText: 'Password',
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 28),
          const SizedBox(width:double.infinity, child:  Text('Forgot your password.', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.w600, color: AppConstants.primaryColor),),),
          const SizedBox(height: 28),
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
            }, child:const Expanded(flex: 1,  child: Text('Login', style: TextStyle(fontWeight: FontWeight.w900),),),),
          ),
          const SizedBox(height: 28),
          const Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Divider(height: 10,color: Colors.black12,)),
              SizedBox(width: 16,),
              Text('Or Login with', textAlign: TextAlign.center, ),
              SizedBox(width: 16,),
              Expanded(child: Divider(height: 10,color: Colors.black12,)),
            ],
          ),
          const SizedBox(height: 40,),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Container(
          //       Row(
          //         children: [],
          //       )
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}