import 'package:flutter/material.dart';

class ButtonRecord extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final Function onTap;
  final String label;

  const ButtonRecord({Key key, this.iconData, this.color, this.onTap, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {    
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(14)
          )
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 55,
              width: 55,              
              child: Icon(iconData),              
            ),
            SizedBox(width: 20,),
            Text(label,style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              fontSize: 30
            ),)
          ],
        ),
        
      ),
    );
  }
}