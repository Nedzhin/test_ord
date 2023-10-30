import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// Ther brief description of the full logic:
// There is 4 stateless widgets and 1 main home stateful widget.
// 2 widgets are for 'Recipient address'( add address form and select address form) and other 2 for the 'Sender Address'( add address form and select address form)
// this 2 widgets will be selected by if logic and looking to the variable 'showRecipient Form'(this is modified by buttons)


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrderPage(),
    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // Variables for changing the 'Add address' and 'Select address' stateless widgets
  bool showRecipientForm = true;
  bool showSenderForm = true;

  // Variables for changing the color
  Color RecepientAddButtonBackgroundColor = Color(0xFFEA560D);
  Color RecepientAddButtonFontColor = Colors.white;
  Color RecepientSelectButtonBackgroundColor = Color(0xFFE7ECF0);
  Color RecepientSelectButtonFontColor =  Color(0xFF919DAB);

  Color SenderAddButtonBackgroundColor = Color(0xFFEA560D);
  Color SenderAddButtonFontColor = Colors.white;
  Color SenderSelectButtonBackgroundColor = Color(0xFFE7ECF0);
  Color SenderSelectButtonFontColor =  Color(0xFF919DAB);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          LineAwesomeIcons.angle_left,
          color: Colors.black,),
          backgroundColor: Colors.white,
        title: const Text('Ordering',
            style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
              padding: EdgeInsets.all(20),
              child: const Text(
                'Step 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF172027),
                  fontSize: 16,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.16,),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Form(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 12,
                      width: 320,
                      child: Container(
                        child: const Text(
                          "Start date",
                          style: TextStyle(
                            color: Color(0xFF172027),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            height: 0.07,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 320,
                      child: TextFormField(

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            hintText: 'Sep 12, 2023',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            prefixIcon: Icon(LineAwesomeIcons.calendar)),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 320,
                    child: Container(
                      child: const Text(
                        "Recipient details",
                        style: TextStyle(
                          color: Color(0xFF172027),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 0.08,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  SizedBox(
                    width: 320,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                      Expanded(
                        child: ElevatedButton(

                        onPressed: (){
                          setState(() {
                                    showRecipientForm = true;
                                    RecepientAddButtonBackgroundColor = Color(0xFFEA560D);
                                    RecepientAddButtonFontColor = Colors.white;
                                    RecepientSelectButtonBackgroundColor = Color(0xFFE7ECF0);
                                    RecepientSelectButtonFontColor =  Color(0xFF919DAB);
                                });
                        },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: RecepientAddButtonBackgroundColor,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),),
                        child: Text('Add Address',
                        style: TextStyle(color: RecepientAddButtonFontColor)),
                        ),
                      ),
                      SizedBox(width: 7),
                      Expanded(
                        child: ElevatedButton(

                          onPressed: () {
                            setState(() {
                              showRecipientForm = false;
                              RecepientAddButtonBackgroundColor =  Color(0xFFE7ECF0);
                              RecepientAddButtonFontColor = Color(0xFF919DAB);
                              RecepientSelectButtonBackgroundColor = Color(0xFFEA560D);
                              RecepientSelectButtonFontColor =  Colors.white;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: RecepientSelectButtonBackgroundColor,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),),
                          child: Text('Select Address',
                          style: TextStyle(color: RecepientSelectButtonFontColor,),),
                        ),
                      ),],
                    ),
                  ),

                  // Logic for selecting the appropriate stateless widget
                  if(showRecipientForm)
                    RecipientAddressForm()
                  else
                    SelectRecipientAddress()

                ],
              ),
            ),

            SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 320,
                    child: Container(
                      child: const Text(
                        "Sender details",
                        style: TextStyle(
                          color: Color(0xFF172027),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 0.08,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),

                  SizedBox(
                    width: 320,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                showSenderForm = true;
                                SenderAddButtonBackgroundColor = Color(0xFFEA560D);
                                SenderAddButtonFontColor = Colors.white;
                                SenderSelectButtonBackgroundColor = Color(0xFFE7ECF0);
                                SenderSelectButtonFontColor =  Color(0xFF919DAB);
                              });
                            },
                            child: Text('Add Address', style: TextStyle(color: SenderAddButtonFontColor),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: SenderAddButtonBackgroundColor,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),),
                          ),
                        ),
                        SizedBox(width: 7),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showSenderForm = false;
                                SenderAddButtonBackgroundColor = Color(0xFFE7ECF0);
                                SenderAddButtonFontColor = Color(0xFF919DAB);
                                SenderSelectButtonBackgroundColor =  Color(0xFFEA560D);
                                SenderSelectButtonFontColor =   Colors.white;
                              });
                            },
                            child: Text('Select Address', style: TextStyle(color: SenderSelectButtonFontColor),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: SenderSelectButtonBackgroundColor,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),),
                          ),
                        ),],
                    ),
                  ),

                  // Logic for selecting the appropriate stateless widget
                  if (showSenderForm)
                    SenderAddressForm()
                  else
                    SelectSenderAdress()
                  ,
                  SizedBox(
                    width: 320,

                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFEA560D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                        ),
                        ),
                        onPressed: () {
                          // Save the recipient address
                        },
                        child: Text('Next Step'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


// Sender Form widget
class SenderAddressForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: <Widget>[
            // Input fields for recipient address
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Full name*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),
            TextFormField(

              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Ko Yuri',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  prefixIcon: Icon(LineAwesomeIcons.person_entering_booth)),

            ),

            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Email*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),
            TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'yuri@email.com',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), prefixIcon: Icon(LineAwesomeIcons.mail_bulk)),
            ),

            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Phone*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: '+375294545687',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), prefixIcon: Icon(LineAwesomeIcons.phone),
              ),),

            const Divider(height: 16,),

            SizedBox(height: 12,),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Country*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),

            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Italy',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), prefixIcon: Icon(LineAwesomeIcons.map_marked),
              ),
            ),

            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'City*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),

            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Naple',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), prefixIcon: Icon(LineAwesomeIcons.building),
              ),
            ),


            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Address line 1*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),

            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Via Toledo 256',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), prefixIcon: Icon(LineAwesomeIcons.map_pin),
              ),
            ),
            SizedBox(height: 20, ),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Add address line +',
                  style: TextStyle(
                    color: Color(0xFFEA560D),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Postcode*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),

            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: '80100',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), prefixIcon: Icon(LineAwesomeIcons.home),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Select Sender Address
class SelectSenderAdress extends StatelessWidget {
  const SelectSenderAdress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  prefixIcon: Icon(LineAwesomeIcons.search)),

            ),
            SizedBox(height: 12,),
            Container(
              width: 335,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: ShapeDecoration(
                color: Color(0xFF172027),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Denilev Egor',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            height: 0.07,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 271,
                          child: Text(
                            'Belarus, Minsk, Derzhinskogo 3b, 80100',
                            style: TextStyle(
                              color: Color(0xFFFFFAF8),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Recipient Form widget
class RecipientAddressForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: <Widget>[

            // Input fields for recipient address
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Full name*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),


            SizedBox(height: 12,),
             TextFormField(

                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Danilev Egor',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                                  prefixIcon: Icon(LineAwesomeIcons.person_entering_booth)),

             ),


            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Email*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),
            TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'egor_zu@email.com',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), prefixIcon: Icon(LineAwesomeIcons.mail_bulk)),
            ),


            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Phone*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: '+375726014690',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), prefixIcon: Icon(LineAwesomeIcons.phone),
            ),),
            const Divider(height: 16,),
            SizedBox(height: 12,),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Country*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),

            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Belarus',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), prefixIcon: Icon(LineAwesomeIcons.map_marked),
            ),
            ),

            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'City*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),

            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Minsk',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), prefixIcon: Icon(LineAwesomeIcons.building),
              ),
            ),


            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Address line 1*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),

            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Derzhinskogo 3b',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), prefixIcon: Icon(LineAwesomeIcons.map_pin),
              ),
            ),
            SizedBox(height: 20, ),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Add address line +',
                  style: TextStyle(
                    color: Color(0xFFEA560D),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: const Text(
                  'Postcode*',
                  style: TextStyle(
                    color: Color(0xFF323F4B),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),

            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: '220069',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), prefixIcon: Icon(LineAwesomeIcons.home),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectRecipientAddress extends StatelessWidget {
  const SelectRecipientAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  prefixIcon: Icon(LineAwesomeIcons.search)),

            ),
            SizedBox(height: 12,),
            Container(
              width: 335,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: ShapeDecoration(
                color: Color(0xFF172027),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ko Yuri',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            height: 0.07,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 271,
                          child: Text(
                            'Italy, Naple, Via Toledo 256, 220069',
                            style: TextStyle(
                              color: Color(0xFFFFFAF8),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


