import 'package:flutter/material.dart';
 class TechDescriptionCard extends StatelessWidget {
   String descriptionText;
   TechDescriptionCard({Key? key, required this.descriptionText}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Card(
       color: Colors.purple[100],
       elevation: 15,
       shadowColor: Colors.purple[900],
       child:  Padding(
         padding: const EdgeInsets.all(20.0),
         child: Center(
           child: Text(
             descriptionText,
             style: const TextStyle(
               color: Colors.black87,
               fontSize: 16,
               fontWeight: FontWeight.w600,
               letterSpacing: 1.25,
             ),
           ),
         ),
       ),
     );
   }
 }
 