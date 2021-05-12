import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //  _agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(children: [
          ListaWidget(
            listaNumeros: _listaNumeros,
            scrollController: _scrollController,
            obtenerPagina1: obtenerPagina1,
          ),
          LoadingWidget(
            isLoading: _isLoading,
          )
        ]));
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
    _agregar10();
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }
}

class ListaWidget extends StatelessWidget {
  final Future<Null> Function() obtenerPagina1;
  final List<int> listaNumeros;
  final ScrollController scrollController;
  const ListaWidget({
    Key key,
    @required this.listaNumeros,
    @required this.scrollController,
    @required this.obtenerPagina1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: scrollController,
        itemCount: listaNumeros.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final imagen = listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/images/jar-loading.gif'),
            fit: BoxFit.cover,
            image: NetworkImage('https://picsum.photos/300/200?image=$imagen'),
          );
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  const LoadingWidget({
    Key key,
    @required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
