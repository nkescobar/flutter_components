import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://media-exp1.licdn.com/dms/image/C4E03AQGsFPacjpYYFA/profile-displayphoto-shrink_200_200/0?e=1609372800&v=beta&t=mV8mVW1oWO2xBa5PIzQajq7DDCfhaZlPySD7oXZpAnY'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/images/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          image: NetworkImage(
              'https://d3t4nwcgmfrp9x.cloudfront.net/upload/claves-incorporar-innovacion-empresa.jpg'),
        ),
      ),
    );
  }
}
