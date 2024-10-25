import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Brandapage extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final String nama = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Branda', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false, 
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(
                    Icons.person,
                    size: 125,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 45,),
              const Text(
                'Selamat Datang',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 24
                ),
              ),
              Text(
                nama,
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w800,
                  fontSize: 54
                ),
              ),
              const Text(
                'Fluter Pemula', style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 18
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
                    exit(0);
                  } else {
                    print("Fungsi keluar tidak tersedia untuk platform ini.");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Color.fromARGB(255, 240, 6, 6),
                ),
                child: const Text('Keluar'),
              ),
            ]
          ),
        ),
      )
    );
  }
}