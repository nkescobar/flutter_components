import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        //padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        children: [
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      // clipBehavior: Clip.antiAlias,
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text(
                'Esta es la descripcion de la tarjeta que asnas aasnasnas asnaksnkasn asjnasjbf ja kdnsdnnsdnsdjsndns aksakmksma'),
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, -10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: Column(
            children: [
              FadeInImage(
                fadeInDuration: Duration(milliseconds: 200),
                height: 250,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://lh3.googleusercontent.com/proxy/fOUUiZLGkv_t1reTuCi_bClDxwWRw2bbfYTw8Xttcoluwh5vMB1m_Ky02nQ3cey5sIOsknD325WfIkO0wC3AOzT8Du3Q8-cx9IWLANT381elAfMD3oO1785WTltAqX7PsE-QS6j15bZv5K0VcmB7Cfxm'),
              ),
              /* Image(
                image: NetworkImage(
                    'https://lh3.googleusercontent.com/proxy/fOUUiZLGkv_t1reTuCi_bClDxwWRw2bbfYTw8Xttcoluwh5vMB1m_Ky02nQ3cey5sIOsknD325WfIkO0wC3AOzT8Du3Q8-cx9IWLANT381elAfMD3oO1785WTltAqX7PsE-QS6j15bZv5K0VcmB7Cfxm'),
              ),*/
              Container(
                padding: EdgeInsets.all(10),
                child: Text('Texto'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
