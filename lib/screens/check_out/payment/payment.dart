import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/screens/check_out/payment/order_item.dart';
class Payment extends StatefulWidget {
  

  @override
  State<Payment> createState() => _PaymentState();
}
enum PaymentOption{
  Cash,
  SyriatelCash,
  MtnCash
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    var paymentoptions = PaymentOption.Cash; 
    return Scaffold(
    appBar: AppBar(
      title: Text(
        "Payment",
        style: TextStyle(
          fontSize: 18,
        ),),
    ),
    bottomNavigationBar: ListTile(
      title: Text("total amount"),
      subtitle: Text("\$300"),
      trailing:Container(
        width: 160,
        child: MaterialButton(
          onPressed:(){

          },
          child: Text(
            "Pleace order",
            style: TextStyle(
              color: textColor,
            ),
            ),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
        ),
      ),
    ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: 1,
              itemBuilder:(context , index){
                return Column(
                    children: [
                      ListTile(
                        title: Text("First & Last name"),
                        subtitle: Text("asdasdasadas"),
                      ),
                      Divider(),
                      ExpansionTile(
                        children: [
                          OrderItem(),
                          OrderItem(),
                          OrderItem(),
                          OrderItem(),
                          OrderItem(),
                        ],
                        title: Text("order item")
                        ),
                        Divider(),
                        ListTile(
                          minVerticalPadding: 5,
                          leading: Text(
                            "sub total",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          trailing:Text(
                            "\$200",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            ) ,


                        ),
                         ListTile(
                          minVerticalPadding: 5,
                          leading: Text(
                            "Delivery coast",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          trailing:Text(
                            "\$10",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            ) ,


                        ),
                         ListTile(
                          minVerticalPadding: 5,
                          leading: Text(
                            "discount",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          trailing:Text(
                            "\$0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            ) ,


                        ),
                        Divider(),
                        ListTile(
                          leading: Text("payment option"),
                        ),
                        // RadioListTile(
                        //   value: PaymentOption.Cash,
                        //   groupValue: paymentoptions,
                        //   title: Text("cash"),
                        //   onChanged: (PaymentOption? value){
                        //       setState(() {
                        //       paymentoptions = value as PaymentOption;
                        //     });
                        //   },),
                        RadioListTile(
                          value: PaymentOption.SyriatelCash,
                          groupValue: paymentoptions,
                          title: Text("Syriatel cash"),
                          onChanged: (PaymentOption? value){
                            setState(() {
                              paymentoptions = value as PaymentOption;
                            });

                          },),
                        // RadioListTile(
                        //   value: PaymentOption.MtnCash,
                        //   groupValue: paymentoptions,
                        //   title: Text("MTN cash"),
                        //   onChanged: (PaymentOption?  value){
                        //       setState(() {
                        //       paymentoptions = value as PaymentOption;
                        //     });
                        //   },),
                    ],
                );
              } ,
              ),
          ),
    );
  }
}