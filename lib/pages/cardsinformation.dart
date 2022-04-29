import 'package:api_snowman/widgets/appbar.dart';
import 'package:api_snowman/widgets/background.dart';
import 'package:api_snowman/widgets/textstyle.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardsInformation extends StatefulWidget {

String? image;
String? name;
String? flavorText;

  CardsInformation({ Key? key,
  required this.name,
  required this.image,
  required this.flavorText,
  }) : super(key: key);

  @override
  State<CardsInformation> createState() => _CardsInformationState();
}

class _CardsInformationState extends State<CardsInformation> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BackgroundApp.boxDecoration,
        ),
        Scaffold(
          appBar: LogoBar.appBar,
          body: Center(
            child: GridView(
              padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1),
                children: [
                  Container(decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('${widget.image}')
                    ),
                    )
                    ),
          
                  Container(
                    color: const Color.fromARGB(0, 33, 149, 243),
                    child:
                      Column(
                        children: [
          
                          const SizedBox(height: 25),
          
                          BorderedText(
                            strokeWidth: 4.0,
                            strokeColor: Colors.black,
                            child: Text('${widget.name}',
                            textAlign: TextAlign.center,
                            style: TextStyleCards.textStyle,
                            ),
                          ),
          
                          const SizedBox(height: 25),
          
                          Container(
                            decoration: const BoxDecoration(
                              
                              color: Color.fromARGB(130, 117, 62, 23),
                              borderRadius: BorderRadius.all(
                               Radius.circular(40),
                            )
                            ),
                            padding: const EdgeInsets.all(20),
                            alignment: AlignmentDirectional.center,
                           
                            child: BorderedText(
                              strokeWidth: 4.0,
                              strokeColor: Colors.black,
                              child: Text('${widget.flavorText}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                              ),
                            ),
                          )
          
                        ],
                      ),
                    ),
              ]
              ),
            ),
          ),
      ],
    );
  }
}