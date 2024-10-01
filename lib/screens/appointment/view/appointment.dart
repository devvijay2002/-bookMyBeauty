import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../components/kcustom_button.dart';

class appointmentRoute extends StatefulWidget {
  const appointmentRoute({super.key});

  @override
  State<appointmentRoute> createState() => _appointmentRouteState();
}

class _appointmentRouteState extends State<appointmentRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
          appBar:  const GlobalAppBar(title: "Appointment",
          centerTitle: true,),
      body:
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    // padding: const EdgeInsets.all(3),
                    margin: const EdgeInsets.all(16),
                    width: 300,
                    height: 50,
                    child:const KCustomButton(buttonText: "Past Appointments",
                     ),
                    ),
                  IconButton(
                    onPressed: () {
                      // Wrap the showMenu function with Theme to apply the white background
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(150, 150, 25, 25), // Adjust position as needed
                        items: [
                          const PopupMenuItem(
                            value: 'lastOneMonth',
                            child: Center(child: Text('Last 1 Month')),
                          ),
                          const PopupMenuItem(
                            value: 'lastTwoMonths',
                            child: Center(child: Text('Last 2 Months')),
                          ),
                          const PopupMenuItem(
                            value: 'lastThreeMonths',
                            child: Center(child: Text('Last 3 Months')),
                          ),
                        ],
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ).then((value) {
                        if (value != null) {
                          print('Selected: $value'); // Handle selected value
                        }
                      });
                    },
                    icon: Icon(Icons.dehaze),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 14,left: 16,right: 16,bottom: 8),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Blow Dry Styling Hair",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 5,),
                          const Text("24 Sep. 2024"),
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.access_time,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 10,),
                          const Text("Morning 10:30 AM",),
                          const Spacer(),
                          IconButton(onPressed: (){
                            print("left arrow button Pressed");
                          },
                              // icon: Icon(Icons.arrow_right_alt_outlined)
                              icon: Icon(Icons.arrow_forward,
                              size: 30,
                              color: Color(0xFFB31217),)
          
                          )
                        ],
                      )
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Blow Dry Styling Hair",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 5,),
                          const Text("24 Sep. 2024"),
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.access_time,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 10,),
                          const Text("Morning 10:30 AM",),
                          const Spacer(),
                          IconButton(onPressed: (){
                            print("left arrow button Pressed");
                          },
                              // icon: Icon(Icons.arrow_right_alt_outlined)
                              icon: Icon(Icons.arrow_forward,
                                size: 30,
                                color: Color(0xFFB31217),)
          
                          )
                        ],
                      )
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Blow Dry Styling Hair",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 5,),
                          const Text("24 Sep. 2024"),
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.access_time,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 10,),
                          const Text("Morning 10:30 AM",),
                          const Spacer(),
                          IconButton(onPressed: (){
                            print("left arrow button Pressed");
                          },
                              // icon: Icon(Icons.arrow_right_alt_outlined)
                              icon: Icon(Icons.arrow_forward,
                                size: 30,
                                color: Color(0xFFB31217),)
          
                          )
                        ],
                      )
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Blow Dry Styling Hair",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 5,),
                          const Text("24 Sep. 2024"),
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.access_time,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 10,),
                          const Text("Morning 10:30 AM",),
                          const Spacer(),
                          IconButton(onPressed: (){
                            print("left arrow button Pressed");
                          },
                              // icon: Icon(Icons.arrow_right_alt_outlined)
                              icon: Icon(Icons.arrow_forward,
                                size: 30,
                                color: Color(0xFFB31217),)
          
                          )
                        ],
                      )
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Blow Dry Styling Hair",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 5,),
                          const Text("24 Sep. 2024"),
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.access_time,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 10,),
                          const Text("Morning 10:30 AM",),
                          const Spacer(),
                          IconButton(onPressed: (){
                            print("left arrow button Pressed");
                          },
                              // icon: Icon(Icons.arrow_right_alt_outlined)
                              icon: Icon(Icons.arrow_forward,
                                size: 30,
                                color: Color(0xFFB31217),)
          
                          )
                        ],
                      )
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Blow Dry Styling Hair",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 5,),
                          const Text("24 Sep. 2024"),
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.access_time,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 10,),
                          const Text("Morning 10:30 AM",),
                          const Spacer(),
                          IconButton(onPressed: (){
                            print("left arrow button Pressed");
                          },
                              // icon: Icon(Icons.arrow_right_alt_outlined)
                              icon: Icon(Icons.arrow_forward,
                                size: 30,
                                color: Color(0xFFB31217),)
          
                          )
                        ],
                      )
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Blow Dry Styling Hair",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 5,),
                          const Text("24 Sep. 2024"),
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.access_time,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 10,),
                          const Text("Morning 10:30 AM",),
                          const Spacer(),
                          IconButton(onPressed: (){
                            print("left arrow button Pressed");
                          },
                              // icon: Icon(Icons.arrow_right_alt_outlined)
                              icon: Icon(Icons.arrow_forward,
                                size: 30,
                                color: Color(0xFFB31217),)
          
                          )
                        ],
                      )
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Blow Dry Styling Hair",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 5,),
                          const Text("24 Sep. 2024"),
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.access_time,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 10,),
                          const Text("Morning 10:30 AM",),
                          const Spacer(),
                          IconButton(onPressed: (){
                            print("left arrow button Pressed");
                          },
                              // icon: Icon(Icons.arrow_right_alt_outlined)
                              icon: Icon(Icons.arrow_forward,
                                size: 30,
                                color: Color(0xFFB31217),)
          
                          )
                        ],
                      )
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Blow Dry Styling Hair",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 5,),
                          const Text("24 Sep. 2024"),
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.access_time,
                            color: Color(0xFF989898),
                          ),
                          const SizedBox(width: 10,),
                          const Text("Morning 10:30 AM",),
                          const Spacer(),
                          IconButton(onPressed: (){
                            print("left arrow button Pressed");
                          },
                              // icon: Icon(Icons.arrow_right_alt_outlined)
                              icon: Icon(Icons.arrow_forward,
                                size: 30,
                                color: Color(0xFFB31217),)
          
                          )
                        ],
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
      );
  }
}

