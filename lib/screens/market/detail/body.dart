import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import 'package:flutter_file_store/constants/Product.dart';

import 'package:flutter_file_store/providers/user_provider.dart';

import 'package:flutter_file_store/screens/market/detail/image.dart';
import 'package:flutter_file_store/screens/market/detail/title_and_price.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(size: size, image: product.image),
          TitleAndPrice(title: product.title, country: product.country, price: product.price),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              FutureBuilder(
                future: context.watch<UserProvider>().isLogged(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Text('');
                  else if (snapshot.hasData) {
                    if (snapshot.data != false) {
                      return SizedBox(
                        width: size.width / 2,
                        height: 84,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                          ),
                          color: Colors.orange,
                          onPressed: () async {
                            final userProvider = Provider.of<UserProvider>(context, listen: false);
                            final res = await userProvider.addToCart(product);

                            if (!res)
                              Toast.show("An error happened !", context, backgroundColor: Colors.red);
                            else
                              Toast.show("The product has been added to the cart !", context, backgroundColor: Colors.green);
                          },
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    } else
                      return Text('');
                  } else if (snapshot.hasError)
                    return Text("ERROR: ${snapshot.error}");
                  else
                    return Text('');
                },
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Text("Description"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
