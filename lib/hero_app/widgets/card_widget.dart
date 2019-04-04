import 'package:flutter/material.dart';
import '../screens/detail_screen.dart';

class CardWidget extends StatelessWidget {
  final _imageUrl;
  final _texto;

  CardWidget(this._texto, this._imageUrl);

  @override
  build(context) => GestureDetector(
        child: _crearContenedor(),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(_texto, _imageUrl)));
        },
      );

  _crearContenedor() => Center(
        child: SizedBox(
          width: 250,
          height: 325,
          child: Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color.fromARGB(30, 0, 0, 0),
                      offset: Offset(0.0, 10.0),
                      spreadRadius: 0,
                      blurRadius: 10)
                ]),
            child: Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _crearImagenFondo(),
                    Column(
                      children: [
                        Container(margin: EdgeInsets.only(top: 10)),
                        _crearHeader(),
                        Expanded(child: Container()),
                        _mensaje()
                      ],
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
      );

  _crearHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Text('16',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                Text('Oct', style: TextStyle(color: Colors.white)),
                Text('2019', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Container(
            child: Icon(Icons.favorite, color: Colors.white, size: 50),
            margin: EdgeInsets.only(right: 10),
          )
        ],
      );

  _crearImagenFondo() => Hero(
        child: Image(
          image: NetworkImage(_imageUrl),
          fit: BoxFit.cover,
        ),
        tag: _texto,
      );

  _mensaje() => Container(
        alignment: Alignment.bottomLeft,
        margin: EdgeInsets.only(bottom: 20, left: 20),
        child: Text(
          _texto,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      );
}
