import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _textField(
              const Icon(
                Icons.email_outlined,
                color: Colors.blue,
              ),
              const Text("E-mail"),
              "Enter your E-mail Address"),
          const SizedBox(height: 20,),
          _textField(
              const Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              const Text("Password"),
              "Enter your Password"),
          const SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerRight,
              child: TextButton(onPressed: (){}, child: const Text('Remember Password'))),
          const SizedBox(height: 20,),
          SizedBox(
            width: 340,
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
                onPressed: (){},
                child: const Text('Login', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),)),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(onPressed: (){},
                  child: const Text('Create a new account'))
            ],
          )
        ],
      ),
    );
  }

}

Widget _textField(Icon icon, Text label, String hintText) {
  return TextFormField(
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(.5),
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: icon,
          label: label,
          hintText: hintText));
}

// TextFormField(
// style: const TextStyle(
// color: Colors.black,
// ),
// decoration: InputDecoration(
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20),
// borderSide: BorderSide(
// color: Colors.black.withOpacity(.5),
// width: 1.5,
// ),
// ),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20),
// ),
// prefixIcon: const Icon(Icons.email_outlined, color: Colors.blue,),
// label: const Text("E-mail"),
// hintText: "Enter your E-mail Address"
// ),
// ),
