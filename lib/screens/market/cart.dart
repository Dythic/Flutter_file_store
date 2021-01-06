import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_file_store/providers/user_provider.dart';

import 'package:flutter_file_store/screens/market/cart/body.dart';
import 'package:flutter_file_store/screens/market/cart/default_button.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return FutureBuilder(
      future: userProvider.isLogged(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Your Cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Center(child: CircularProgressIndicator())
          );
        else if (snapshot.hasData) {
          if (snapshot.data != false) {
            return Scaffold(
              appBar: buildAppBar(context, userProvider.getCountInCart()),
              body: Body(),
              bottomNavigationBar: CheckOurCard(),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  "Your Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: Center(
                child: Text('Login to access the cart !', style: TextStyle(fontSize: 20))
              ),
            );
          }
        } else if (snapshot.hasError)
          return Text("ERROR: ${snapshot.error}");
        else
          return Text('');
      },
    );
  }

  AppBar buildAppBar(BuildContext context, int itemNbr) {
    return AppBar(
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "$itemNbr items",
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}

class CheckOurCard extends StatelessWidget {
  const CheckOurCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      //height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text(
                  "Add voucher code",
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.black,
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: "\$${context.watch<UserProvider>().getTotalFromCart().toString()}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 190,
                  child: DefaultButton(
                    text: "Check out",
                    press: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
