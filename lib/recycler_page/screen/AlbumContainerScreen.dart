import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumContainerScreen extends StatelessWidget {
  AlbumContainerScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeaeaea),
      body: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: ListView(
          padding: EdgeInsets.all(2.0),
          addRepaintBoundaries: true,
          shrinkWrap: true,
          children: <Widget>[
            Card(
                elevation: 1.0,
                margin: EdgeInsets.all(3.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/image/scene1.png",
                      width: 80.0,

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Selfies",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight:FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: <Widget>[
                                Text("53", textAlign: TextAlign.left)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Card(
                elevation: 1.0,
                margin: EdgeInsets.all(3.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/image/scene2.png",
                      width: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Pictures",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight:FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: <Widget>[
                                Text("10", textAlign: TextAlign.left)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Card(
                elevation: 1.0,
                margin: EdgeInsets.all(3.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/image/scene3.png",
                      width: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "WhatsApp image",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight:FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: <Widget>[
                                Text("153", textAlign: TextAlign.left)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Card(
                elevation: 1.0,
                margin: EdgeInsets.all(3.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/image/scene4.png",
                      width: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Screenshots",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight:FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: <Widget>[
                                Text("15", textAlign: TextAlign.left)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Card(
                elevation: 1.0,
                margin: EdgeInsets.all(3.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/image/scene5.png",
                      width: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Facebook",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight:FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: <Widget>[
                                Text("1053", textAlign: TextAlign.left)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Card(
                elevation: 1.0,
                margin: EdgeInsets.all(3.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/image/scene6.png",
                      width: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Photos",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight:FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: <Widget>[
                                Text("1538", textAlign: TextAlign.left)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Card(
                elevation: 1.0,
                margin: EdgeInsets.all(3.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/image/scene4.png",
                      width: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Videos",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight:FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: <Widget>[
                                Text("13", textAlign: TextAlign.left)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),

          ],
        ),
      ),
    );
  }
}
