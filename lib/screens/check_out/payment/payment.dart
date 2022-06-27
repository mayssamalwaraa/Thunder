import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/model/delivery_address_model.dart';
import 'package:foodapp/providers/cart_view_provider.dart';
import 'package:foodapp/screens/check_out/delivery_details/single_delivery_item.dart';
import 'package:foodapp/screens/check_out/payment/order_item.dart';
import 'package:foodapp/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
class Payment extends StatefulWidget {
   DeliveryAddressModel? deliveryAddresslist;
   Payment({
    this.deliveryAddresslist,
   });

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
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double subtotal = reviewCartProvider.getTotalPrice();
    double deliverycoast = 10.0;
    double totalCoast = subtotal + deliverycoast;

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
      subtitle: Text("\$${totalCoast}"),
      trailing:Container(
        width: 160,
        child: MaterialButton(
          onPressed:(){
             Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> HomeScreen()));
                    Fluttertoast.showToast(msg: "wait your order");

          },
          child: Text(
            "pay",
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
                      SingleDeliveryItem(
                    address: "${widget.deliveryAddresslist?.city} ${widget.deliveryAddresslist?.street} ",
                    addressType: "Home",
                    number: "${widget.deliveryAddresslist?.mobileNo}",
                    title: "${widget.deliveryAddresslist?.firstName} ${widget.deliveryAddresslist?.lastName}",
                  ),
                      Divider(),
                      ExpansionTile(
                        children:reviewCartProvider.getReviewCartDataList.map((e) {
                          return OrderItem(e: e,);
                        }).toList()
                        as List<Widget>,
                        title: Text("order item ${reviewCartProvider.getReviewCartDataList.length}")
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
                            "\$${subtotal}",
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
                            "\$${deliverycoast}",
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