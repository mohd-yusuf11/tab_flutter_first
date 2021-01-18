import 'package:flutter/material.dart';


class TabItem extends StatelessWidget {
  final String  text;
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  const TabItem({Key key, this.text, this.icon,this.isSelected,this.onTap,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon,color: isSelected?Colors.white: Colors.grey,),
          Text(text,style: TextStyle(
            color: isSelected? Colors.white:Colors.grey,
            fontWeight: isSelected? FontWeight.w700:FontWeight.normal,fontSize: 12,
          ),),
          ],
        ),
      ),
      onTap:(){},
    );
  }
}
