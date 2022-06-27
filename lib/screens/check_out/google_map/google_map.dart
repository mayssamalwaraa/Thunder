import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/check_out_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class CustomGooglePlay extends StatefulWidget {
  const CustomGooglePlay({ Key? key }) : super(key: key);

  @override
  State<CustomGooglePlay> createState() => _CustomGooglePlayState();
}

class _CustomGooglePlayState extends State<CustomGooglePlay> {
  LatLng _initialcamerapostion = LatLng(20.5937, 78.9629);
  GoogleMapController? controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _value){
    controller = _value;
    _location.onLocationChanged.listen((event) { 
      controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(event.latitude as double , event.longitude as double,),zoom: 15 )
            
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children:[
           GoogleMap(initialCameraPosition: CameraPosition(
              target: _initialcamerapostion,
           ),
           mapType: MapType.normal,
           onMapCreated: _onMapCreated,
           myLocationEnabled: true,
           ),
           Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height:50,
              width: double.infinity,
              margin:EdgeInsets.only(right: 60,left: 10,bottom:40,top: 40),
              child:MaterialButton(
                onPressed: () async{
                  await _location.getLocation().then((value){
                    setState(() {
                      checkoutProvider.setLocation = value;
                    });
                  } );
                  Fluttertoast.showToast(msg: "success add location");
                  Navigator.of(context).pop();
                },
                color:primaryColor,
                child: Text("set Location"),
                shape: StadiumBorder(),
              ),
            ))
            
          ]
        ),
      ),
    );
  }
}