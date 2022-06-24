import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/Screens/Biblioteca.dart';
import 'package:youtube/Screens/EmAlta.dart';
import 'package:youtube/Screens/Inicio.dart';
import 'package:youtube/Screens/Inscricoes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [Inicio(), EmAlta(), Inscricoes(), Biblioteca()];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        title: Image.asset(
          './images/youtube.png',
          height: 22,
          width: 98,
        ),
        actions: <Widget>[
          // IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(
              onPressed: () async {
                String? result = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
              },
              icon: Icon(Icons.search)),
          // IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(label: 'Início', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Em Alta', icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                label: 'Inscrições', icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                label: 'Biblioteca', icon: Icon(Icons.folder)),
          ]),
    );
  }
}
