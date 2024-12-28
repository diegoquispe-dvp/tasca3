import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Background(),
            MainContent(),
          ],
        ),
      ),
    );
  }
}

//MainContent
class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            child: TextField(
              cursorHeight: 20,
              cursorRadius: const Radius.circular(15),
              cursorColor: Colors.white70,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 22),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Colors.white70, width: 5),
                ),
                labelText: 'Escribe el lugar o código postal',
                labelStyle: const TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Background
class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
