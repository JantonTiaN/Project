import 'package:flutter/material.dart';

import 'constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/ToothbrushFix.jpg"),
              fit: BoxFit.cover,
            )),
          )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "DENTAL CARE\n",
                        style: Theme.of(context).textTheme.display1,
                      ),
                      TextSpan(
                        text: "Don't RUSH when you BRUSH",
                        style: Theme.of(context).textTheme.headline,
                      )
                    ],
                  ),
                ),
                FittedBox(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 125),
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: bPrimaryColor,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "START CHECK UP",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
