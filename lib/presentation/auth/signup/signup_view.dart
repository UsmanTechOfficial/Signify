import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
    const SignupView({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Signup'),
            ),
            body: const Center(
                child: Text('Welcome to Signup Page'),
            ),
        );
    }
}
