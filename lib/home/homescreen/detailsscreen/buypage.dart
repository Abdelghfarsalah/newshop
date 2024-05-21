import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/constant.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:paymob_payment/paymob_payment.dart';
import 'package:u_credit_card/u_credit_card.dart';

class buybage extends StatefulWidget {
  const buybage({super.key, required this.model});
  final productmodel model;

  @override
  State<buybage> createState() => _buybageState();
}

class _buybageState extends State<buybage> {
  int indexselext = 0;
  var snackBar = const SnackBar(
    content: Text('Your purchase was completed successfully'),
  );
  @override
  Widget build(BuildContext context) {
    dynamic price = widget!.model.price * 100;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            Text(
              "Convenient Payment",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 100,
                width: 55,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Icon(FontAwesomeIcons.ellipsis)),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            CreditCardUi(
              cardHolderFullName: 'John Doe',
              cardNumber: '1234567812345678',
              validFrom: '01/23',
              validThru: '01/28',
              topLeftColor: Color.fromARGB(255, 72, 72, 72),
              doesSupportNfc: true,
              placeNfcIconAtTheEnd: true,
              enableFlipping: true,
              width: MediaQuery.sizeOf(context).width * 0.9,
              balance: 128.32434343,
              cvvNumber: '123',
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              indent: 10,
              endIndent: 10,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "  Payment Method..",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Row(
              children: [
                paymentmethod(
                  onTap: () {
                    indexselext = 0;
                    setState(() {});
                  },
                  image: const Icon(
                    FontAwesomeIcons.paypal,
                    size: 60,
                    color: Color.fromARGB(255, 3, 50, 88),
                  ),
                  select: indexselext == 0,
                ),
                paymentmethod(
                  onTap: () {
                    indexselext = 1;
                    setState(() {});
                  },
                  image: const Icon(
                    FontAwesomeIcons.applePay,
                    size: 60,
                    color: Colors.orange,
                  ),
                  select: indexselext == 1,
                ),
                paymentmethod(
                  onTap: () {
                    indexselext = 2;
                    setState(() {});
                  },
                  image: const Text(
                    "+",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 60,
                        fontWeight: FontWeight.w900),
                  ),
                  select: indexselext == 2,
                ),
                const Divider(
                  color: Colors.grey,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              indent: 10,
              endIndent: 10,
            ),
            const ListTile(
              title: Text(
                "Number",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                "1",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue),
              ),
            ),
            ListTile(
              title: const Text(
                "Total Price",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                "${widget.model.price}\$",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                PaymobPayment.instance.pay(
                  context: context,
                  currency: "EGP",
                  amountInCents: "${price}",
                  onPayment: (response) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                );
              },
              child: Container(
                height: 60,
                color: Colors.black,
                width: MediaQuery.sizeOf(context).width,
                child: const Row(
                  children: [
                    Text(
                      "  pay now",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: Farro,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(
                      flex: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Color.fromARGB(255, 162, 162, 162),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Color.fromARGB(255, 96, 94, 94),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Color.fromARGB(255, 56, 55, 55),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Color.fromARGB(255, 30, 30, 30),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class paymentmethod extends StatefulWidget {
  const paymentmethod({
    super.key,
    required this.select,
    this.onTap,
    required this.image,
  });
  final bool select;
  final void Function()? onTap;
  final Widget image;
  @override
  State<paymentmethod> createState() => _paymentmethodState();
}

class _paymentmethodState extends State<paymentmethod> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  border:
                      widget.select ? Border.all(color: Colors.black) : null,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: widget.image,
                ),
              ),
            ),
            widget.select
                ? CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.black.withOpacity(0.1),
                    child: const Icon(
                      Icons.done,
                      size: 20,
                      color: Colors.black,
                    ),
                  )
                : const SizedBox(
                    height: 30,
                  )
          ],
        ),
      ),
    );
  }
}
