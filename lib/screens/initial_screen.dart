import 'package:flutter/material.dart';
import 'package:tasca3/screens/cpostal_screen.dart';
import 'package:tasca3/services/cp_service.dart';

class InitialScreen extends StatelessWidget {
  InitialScreen({super.key});

  final inputController = TextEditingController();

  void sendInputTo(context) async {
    final input = inputController.text.trim();

    if (input.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const CpostalScreen(result: 'Error: El campo está vacío.'),
        ),
      );
      return;
    }

    final RegExp numberRegex = RegExp(r'^\d+$'); // Comprueba si es un número.
    if (numberRegex.hasMatch(input)) {
      // Es un número, consulta en la API de números.
      Map<String, dynamic>? result = await CpService.datafromapinumber(input);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CpostalScreen(result: result),
        ),
      );
    } else if (input.contains(RegExp(r'^[a-zA-Z]+$'))) {
      // Es texto, consulta en la API de texto.
      Map<String, dynamic>? result = await CpService.datafromapitext(input);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CpostalScreen(result: result),
        ),
      );
    } else {
      // No cumple con ninguna condición.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const CpostalScreen(result: 'Error: Entrada no válida.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            //Background
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.darken,
                  ),
                  image: const AssetImage('assets/spain.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //Contenido Principal
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(20),
              //decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Conóce mas sobre España...",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: TextField(
                          controller: inputController,
                          cursorHeight: 20,
                          cursorRadius: const Radius.circular(15),
                          cursorColor: Colors.white70,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 22),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  color: Colors.white70, width: 5),
                            ),
                            labelText: 'Escribe el lugar o código postal',
                            labelStyle: const TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      //Botón que envia dato a la API, revisa, devuelve y pasa a cpostal_screen
                      IconButton(
                        onPressed: () => sendInputTo(context),
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
