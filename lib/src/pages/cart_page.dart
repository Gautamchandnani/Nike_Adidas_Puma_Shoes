import 'package:blckdrop/src/models/Model.dart';
import 'package:blckdrop/src/services/appmethods.dart';
import 'package:blckdrop/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../widgets/cart_widget.dart';
import '../widgets/empty_cart_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int lengthOfPrdtCart = PdtOnCart.length;
  int quantityIndex = 1;
  String subTotal = AppMethods.sumOfItemsOnBag();
  String grandTotal = AppMethods.grandTotal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 5,
        elevation: 0,
        backgroundColor: Colors.grey[200],
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: PdtOnCart.isEmpty
              ? EmptyCart()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Title
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 8, left: 10, bottom: 20),
                        child: Text(
                          "My Cart",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    //Products for check out
                    CartPrdtWidget(),

                    SizedBox(
                      height: 20,
                    ),

                    //Order Summary
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: Container(
                        // height: 250,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //TiTLE
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 15.0),
                              child: Text(
                                "Order Summary",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            //Subtotal +  amount
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "SubTotal",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "₹ ${subTotal}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "₹ 100.00",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8, top: 4, bottom: 0),
                              child: Divider(
                                color: Colors.black.withOpacity(0.2),
                                height: 10,
                                thickness: 2,
                              ),
                            ),
                            // GRAND TOTAL
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Grand Total",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "₹ ${grandTotal}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //procced to checkout btn
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        right: 12.0,
                        top: 15.0,
                        bottom: 15.0,
                      ),
                      child: SlideAction(
                        borderRadius: 12,
                        elevation: 2,
                        innerColor: Colors.white,
                        outerColor: Constants.featuresColor,
                        submittedIcon: Icon(
                          Icons.check_rounded,
                          size: 30,
                        ),
                        sliderButtonIcon: ImageIcon(
                          AssetImage("assets/images/doublearrow100.png"),
                          color: Constants.featuresColor,
                          size: 30,
                        ),
                        text: 'Slide To Pay',
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        animationDuration: Duration(milliseconds: 500),
                        onSubmit: () {
                          return null;

                          //do something
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
