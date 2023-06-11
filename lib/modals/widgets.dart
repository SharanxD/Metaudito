
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
    super.key,
    required this.size, required this.header1, required this.header2, required this.imageUrl, required this.page,
  });
  final String header1;
  final String header2;
  final String imageUrl;
  final Size size;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>page));
      },
      child: Container(
        height: size.height*0.18,
        width: size.width*0.27,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              const BoxShadow(color: Colors.purple,blurRadius: 3,offset: Offset(0,4)),
            ]

        ),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 8,),
                Text(header1,style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),),
                Text(header2,style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),),
              ],
            ),
            Container(decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover
              ),
              color: Colors.red,
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
            ),
              width: size.width*0.27,height: size.height*0.12,
            )

          ],
        )),

      ),
    );
  }
}
