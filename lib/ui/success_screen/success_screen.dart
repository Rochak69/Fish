import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildText('Thank You'),
          _buildText('for registering'),
          _buildText('You will get your'),
          _buildText('Login Credentials'),
          _buildText('+977777777'),
          _buildButton('Exit App')
        ],
      ),
    );
  }

  _buildButton(String text) {
    return ElevatedButton(
      onPressed: () {},

      //  signIn,
      child: Text(text, style: const TextStyle(fontSize: 20, color: Colors.white)),
    );
  }

  _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 40,
        color: Colors.blue,
      ),
    );
  }
}
