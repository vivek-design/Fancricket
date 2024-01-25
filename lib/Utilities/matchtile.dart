import 'package:fancrick/Utilities/constants.dart';
import 'package:flutter/material.dart';

class match_tile extends StatefulWidget {
  const match_tile({super.key});

  @override
  State<match_tile> createState() => _match_tileState();
}

class _match_tileState extends State<match_tile> {
  @override
  Widget build(BuildContext context) {
    return  Container(
   
    padding: EdgeInsets.all(20),
        
        child: Container(
          height: 160,
          
           decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 209, 96, 75),
              
           ),

           child: 
           Column(
            children: [
                  SizedBox(
                    height: 10,
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                       Column(
                       
                        children: [
                             CircleAvatar(
                          radius: 35,
                           backgroundImage: NetworkImage('https://m.economictimes.com/thumb/msid-59202287,width-1200,height-900,resizemode-4,imgsize-66221/why-team-india-still-uses-british-era-logo-central-information-commission-to-pmo.jpg', ),
                         ),

                          SizedBox(
                          height: 10,
                        ),
                       
                         Text("India", style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                       ),
                       
                         Container(
                          height: 80,
                          width: 80,
                          child:  Image.asset('assets/images/vs.png') 
                         )
                    ,
                          
                          Column(children: [
                                  CircleAvatar(
                          
                          radius: 35,
                          backgroundImage: NetworkImage('https://ih1.redbubble.net/image.4329544907.4168/st,medium,507x507-pad,600x600,f8f8f8.jpg'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("England ", style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                          ],),


                       


                ]
              ),
              SizedBox(
                height: 10,
              ),

              InkWell(
                onTap: (){

                },
                
                child: Container(
              
                  
                  child: Container(
                    
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 64, 164, 69),
              
                    ),
                    child: Center(child: Text(("Join Now "), style: TextStyle(
                    fontWeight: FontWeight.bold),)),
                  ),
                ),
              )

           
              
            ],
           ),
        ),
    );
  }
}