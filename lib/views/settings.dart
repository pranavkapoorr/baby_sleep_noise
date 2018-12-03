import 'package:baby_sleep_noise/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget{
  @override
  _SettingsState createState() => new _SettingsState();
}
class _SettingsState extends State<Settings>{
  bool _switchValue = false;
  SharedPreferences sp;
  int playTime = 0;

  @override
  void initState() {
    _loadPlaytime();
    super.initState();
  }

  @override
  void dispose() {
    sp.setInt("playTime", playTime);
    super.dispose();
  }

  _loadPlaytime()async{
    sp = await SharedPreferences.getInstance();
    playTime = sp.getInt("playTime");
    print("lodaded plaTyime : $playTime");
    if(playTime==null || playTime==0){
      playTime = 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    Size deviceSize = MediaQuery.of(context).size;
    return playTime!=null?Container(
      decoration: BoxDecoration(gradient: myGradient),
      child: new Scaffold(
        backgroundColor: Colors.transparent,

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: new ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Align(alignment: Alignment.topLeft,child: Text("PlayTime",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          width: deviceSize.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: myShadow,
                              border: Border.all(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Slider(value: playTime/100, onChanged: (val){
                                setState(() {
                                  playTime = val.round() * 100;
                                });
                              }),
                              Text((playTime).round().toString() + " sec",style: TextStyle(color: Colors.black),),
                            ],
                          )
                        ),
                      ),
                      Text("What kind of notification would you like to receive..?",style: TextStyle(color: Colors.grey,fontSize: 12.0),)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Align(alignment: Alignment.topLeft,child: Text("Visibility",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            myContainer(
                              deviceSize.width,
                              Colors.white,
                              BorderRadius.only(topLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Searchable",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
                                    Switch(
                                      inactiveTrackColor: Colors.black,
                                      value: _switchValue,
                                      onChanged: (bool value) {
                                        setState(() {
                                          _switchValue = value;
                                        });
                                      },
                                      activeColor: Colors.blue,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("Would you like to be searched by everyone..?",style: TextStyle(color: Colors.grey,fontSize: 12.0))
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Align(alignment: Alignment.topLeft,child: Text("Support",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            myContainer(
                                deviceSize.width,
                                Colors.white, BorderRadius.only(topLeft: Radius.circular(8.0)),
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(Icons.help,color:Colors.black),
                                        Text("Help & Support",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
                                        SizedBox(width: 10.0,)
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: 10.0,),
                            myContainer(
                                deviceSize.width,
                                Colors.white,
                                BorderRadius.only(bottomRight: Radius.circular(8.0)),
                                InkWell(
                                    child:Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Icon(Icons.bug_report,color:Colors.black),
                                          Text("Report a Bug",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
                                          SizedBox(width: 10.0,)
                                        ],
                                      ),
                                    )
                                )
                            ),
                          ],
                        ),
                      ),
                      Text("We will appreciate for any feedback..!",style: TextStyle(color: Colors.grey,fontSize: 12.0))
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Align(alignment: Alignment.topLeft,child: Text("About",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            myContainer(
                                deviceSize.width,
                                Colors.white,
                                BorderRadius.only(topLeft: Radius.circular(8.0)),
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(Icons.data_usage,color:Colors.black),
                                        Text("Data Policy",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
                                        SizedBox(width: 10.0,)
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: 10.0,),
                            myContainer(
                                deviceSize.width,
                                Colors.white,
                                BorderRadius.only(bottomRight: Radius.circular(8.0)),
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(Icons.indeterminate_check_box,color:Colors.black),
                                        Text("Terms",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
                                        SizedBox(width: 10.0,)
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: 20.0,),
                            myContainer(
                              deviceSize.width,
                              Colors.white,
                              BorderRadius.all(Radius.circular(8.0)),
                              AboutListTile(
                                icon: Icon(Icons.info,color:Colors.black),
                                applicationName: "Sleep Noise",
                                applicationIcon: Icon(Icons.people,color: Colors.grey),
                                child: Text("Sleep Noise",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ):Center(child: CircularProgressIndicator(),);
  }


  Widget myContainer(double width, Color color,BorderRadius borderRadius,Widget child) => new Container(
    width: width,
    decoration: BoxDecoration(
      color: color,
      boxShadow: myShadow,
      borderRadius: borderRadius,
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: child,
  );
}