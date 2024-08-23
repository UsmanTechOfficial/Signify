import 'package:flutter/material.dart';

class RequestSignatureView extends StatelessWidget {
    const RequestSignatureView({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('RequestSignature'),
            ),
            body: const Center(
                child: Text('Welcome to RequestSignature Page'),
            ),
        );
    }
}
