import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final double price = 199.99;
  final String projectName = "Premium Kit";
  final String projectDescription =
      "Unlock access to premium kit with 30+ reusable components.";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Payment Gateway", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blue[100],
        body: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                projectName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                projectDescription,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 30),

              Text(
                "Amount to Pay",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                "₹${price.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),

              Text(
                "Select Payment Method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.account_balance_wallet, color: Colors.blue),
                title: Text("Wallet"),
                trailing: Icon(Icons.check_circle, color: Colors.green),
              ),
              ListTile(
                leading: Icon(Icons.credit_card, color: Colors.blueGrey),
                title: Text("Credit / Debit Card"),
                trailing: Icon(Icons.radio_button_unchecked),
              ),
              ListTile(
                leading: Icon(Icons.payment, color: Colors.deepPurple),
                title: Text("UPI"),
                trailing: Icon(Icons.radio_button_unchecked),
              ),

              Spacer(),

              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Payment Successful!")),
                  );
                },
                child: Text(
                  "Pay ₹${price.toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
