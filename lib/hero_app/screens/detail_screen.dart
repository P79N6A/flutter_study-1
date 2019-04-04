import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final _imageUrl;
  final _texto;

  DetailScreen(this._texto, this._imageUrl);

  @override
  build(context) => Scaffold(body: Center(child: _crearCuerpo()));
  _crearCuerpo() => Column(
        children: [
          Hero(child: Image.network(_imageUrl), tag: _texto),
          Expanded(
            child: Center(
              child: Text(
                _texto,
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ],
      );
}
