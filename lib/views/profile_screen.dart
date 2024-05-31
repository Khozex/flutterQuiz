import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Color(0xFF015055),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE1F396), Color(0xFF6DBE45)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Color(0xFF015055),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Ismael Teles',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF015055),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'ismaelteles75@gmail.com',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF015055),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informações do Usuário',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF015055),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 5),
                    Text(
                      'Escolaridade: Ensino Médio',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF015055),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Membro desde: Janeiro 2024',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF015055),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
