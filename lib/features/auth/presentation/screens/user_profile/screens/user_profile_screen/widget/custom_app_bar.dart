import 'package:flutter/material.dart';

appbar({context, Function()? ontap, IconData? myIcon,Color? mycolor,required String title,bool? isLeading,bool? isAction,List<Widget>? actions}){
  return AppBar(
      centerTitle: true,
      title: Text(title,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
      elevation: 0,
      backgroundColor: Colors.white,
      leading:isLeading==true? GestureDetector(
        onTap:ontap,
        child: Icon(
          myIcon,
          size: 30,
          color: mycolor,
        ),
      ):Container(),
      actions:actions

  );
}