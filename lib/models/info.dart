import 'package:flutter/material.dart';

Future<void> softLevelExplanation(BuildContext context){
  return   showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.black54,
              transitionDuration: Duration(milliseconds: 300),
              pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
                return Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 50,bottom: 50, left: 20, right: 20),
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    
                    child:  Material(
                      color: Colors.transparent,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'SOFT LEVEL EXPLANATION',
                                style: TextStyle(fontSize: 24.0, color: Colors.black,),
                              ),
                              const SizedBox(height: 20,),
                              Image.asset('images/soft_piuma.png',height: 60,width: 60,),
                              const SizedBox(height: 20,),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'The goal of the soft level is to reduce daily alcohol consumption. To do that we use your answer to question number 2. In particular we memorize your answer and calculate the number of drinks that you can drink daily as your answer minus one. For example, if your answer is 3/4 drinks at day with this level you can drink a maximum of 2 driks ( 3 - 1 )',  
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              ElevatedButton(onPressed: () {
                               Navigator.pop(context);
                              }, 
                              child: 
                              const Text('I Got it')
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }, 
              );
}



Future<void> hardLevelExplanation(BuildContext context){
  return   showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.black54,
              transitionDuration: Duration(milliseconds: 300),
              pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
                return Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 50,bottom: 50, left: 20, right: 20),
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    
                    child:  Material(
                      color: Colors.transparent,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'HARD LEVEL EXPLANATION',
                                style: TextStyle(fontSize: 24.0, color: Colors.black,),
                              ),
                              const SizedBox(height: 20,),
                              Image.asset('images/fire.png',height: 60,width: 60,),
                              const SizedBox(height: 20,),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'The goal of the hard level is to delete daily alcohol consumption. At this level you need determination, perseverance and sincerity. In fact, in this level you cannot drink. you will have a counter that will tell you how long it has been since you drank, which will be reset if you answer YES the question that is shown in the level',  
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              ElevatedButton(onPressed: () {
                               Navigator.pop(context);
                              }, 
                              child: 
                              const Text('I Got it')
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }, 
              );
}