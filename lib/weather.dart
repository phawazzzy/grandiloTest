import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: <Widget>[
        Center(
          child: Container(
            child: FlareActor(
              'assets/WorldSpin.flr',
              fit: BoxFit.contain,
              animation: "roll",
            ),
            height: 300,
            width: 300,
          ),
        ),

        ShowWeather(),
      ],
    );
  }
}

class ShowWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 32, left: 32, top: 10),
      child: Column(
        children: <Widget>[
          Text(
            'LAGOS',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '35C',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Temperature',
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '37C',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Min Temparature',
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '38C',
                    style: TextStyle(color: Colors.white70, fontSize: 30),
                  ),
                  Text(
                    'Max Temparature',
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
