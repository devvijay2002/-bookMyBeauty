import 'package:bookmybeauty/components/kcustom_button.dart';
import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';

class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: 'Checkout',
      centerTitle: true,),
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              GestureDetector(
                onTap:() {
                  print("open pop up");
                } ,
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: Color(0xFFB31217),
                    ),
                    SizedBox(width: 8,),
                    Text(
                    "Add More Services",
                      style: TextStyle(
                      color: Color(0xFFB31217),
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
                 ]
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                width: double.infinity,
                // height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10), // Margin for the text container
                        padding: const EdgeInsets.all(5), // Padding for the text inside the container
                        child: const Text("Order Details",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12,left: 7,right: 7,bottom: 6),
                      padding: EdgeInsets.all(10),
        
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD5D6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Book My Beauty Salon",
                            style:
                            TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("Shop No. 105, Ground Floor, Sector-5, Indirapuram, Ghaziabad - 201010")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6,left: 7,right: 7,bottom: 6),
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFAFEDEF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("Home Service Appointment :",
                                  style:
                                  TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                IconButton(onPressed: (){
                                  print("Icon Button pressed");
                                }, icon: const Icon(Icons.edit_square))
                              ],
                            ),
                            const Text("Blow Dry Styling Hair Women (1) Men (0)"),
                            const Text("2 Hrs. 30 Min."),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text("Slot Time :",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                  ),
                                ),
                                IconButton(onPressed: (){
                                  print("Icon button pressed");
                                }, icon: const Icon(Icons.edit_square))
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(Icons.calendar_month_outlined),
                                SizedBox(width: 5,),
                                Text("17 August 2024"),
                                SizedBox(width: 5,),
                                Icon(Icons.access_time_sharp),
                                SizedBox(width: 5,),
                                Text("Morning 11 AM"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6,left: 7,right: 7,bottom: 12),
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3E2FC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("Contact Details :",
                                  style:
                                  TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Spacer(),
                                IconButton(onPressed: (){
                                  print("edit button pressed");
                                }, icon: const Icon(Icons.edit_square))
                              ],
                            ),
                            const Text("Poonam Sharma # 9599043602"),
                            const SizedBox(height: 10,),
                            const Text("House No. 95, Adarsh Nagar, Monday Market, Near Dominos Pizza, Ghaziabad (U.P.) - 201309")
                          ],
                        ),
                      ),
                    ),
                     Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            const Text("Sub Total",
                              style:
                              TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Text("₹ 449",
                              style: TextStyle
                                (
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 22
                             ),
                            ),
                            const SizedBox(width: 10),
                            const Text("1000",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF989898),
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Color(0xFF989898),
                              decorationThickness: 3.0,
                            ),
                            ),
                            const Spacer(),
                            IconButton(onPressed: (){
                              print("Delete button pressed");
                            },
                              icon: const Icon(
                              Icons.delete_outline_sharp,
                              color: Colors.red,
                            ),
                            iconSize: 30,
                            )
                          ],
                        ),
                      ),

                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Cost",
                                style:
                                TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Spacer(),
                              Text("₹ 449",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("You saved:",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold
                               ),
                              ),
                              Spacer(),
                              Text("₹ -100",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold
                                ),

                              ),
                            ],
                          ),
                          Divider(
                            color: Color(0xFF707070),
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Text("Total Cost",
                                style:
                                TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Spacer(),
                              Text("₹ 449",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900
                                ),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text("Note: Pay in-person at the saloon providing the service"),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 50,
        child: const KCustomButton(buttonText: "Submit",
          iconChild: Icon(Icons.arrow_forward,color: Colors.white,),
        ),
      ),
    );
  }
}