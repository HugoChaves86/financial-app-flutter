import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(60, 59, 65, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(27, 26, 46, 1),
        title: const Text('Ajuda'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            color: Color.fromRGBO(27, 26, 46, 1),
            elevation: 4, // Define a elevação da caixa (alto relevo)
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Para ajuda, reportar bugs ou sugestões entre em contato por:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
