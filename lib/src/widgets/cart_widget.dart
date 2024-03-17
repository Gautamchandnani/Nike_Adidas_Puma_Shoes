import 'package:blckdrop/src/models/Model.dart';
import 'package:blckdrop/src/services/appmethods.dart';
import 'package:blckdrop/src/widgets/empty_cart_widget.dart';
import 'package:blckdrop/utils/utils.dart';
import 'package:blckdrop/utils/widget.dart';
import 'package:flutter/cupertino.dart';

class CartPrdtWidget extends StatefulWidget {
  const CartPrdtWidget({super.key});

  @override
  State<CartPrdtWidget> createState() => _CartPrdtWidgetState();
}

class _CartPrdtWidgetState extends State<CartPrdtWidget> {
  int lengthOfPrdtCart = PdtOnCart.length;
  int quantityIndex = 1;

  @override
  Widget build(BuildContext context) {
    return PdtOnCart.isEmpty
        ? EmptyCart()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: PdtOnCart.length,
                  itemBuilder: (context, index) {
                    ShoeModel currentBagItem = PdtOnCart[index];
                    String _price =
                        AppMethods().PriceFormat(currentBagItem.price);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade100,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              //Image
                              Card(
                                margin: EdgeInsets.only(left: 10),
                                elevation: 5,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    fit: BoxFit.contain,
                                    height: 50,
                                    currentBagItem.imgAddress,
                                  ),
                                ),
                              ),
                              Container(
                                // Right overflow bu *131 pixels
                                width:
                                    MediaQuery.of(context).size.width - 133.0,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    //Name + DetailName + Delete icon
                                    Stack(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //NAME + DETAILS
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //NAME
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 6.5,
                                                    right: 0,
                                                    top: 25,
                                                  ),
                                                  child: Text(
                                                    currentBagItem.Name,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts
                                                        .rubikMonoOne(
                                                      color: Constants
                                                          .secondaryColor,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                // DETAIL NAME
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    currentBagItem.DetailName,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Constants
                                                          .secondaryColor,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // DELETE BUTTON
                                        Positioned(
                                          right: 8,
                                          top: 8,
                                          child: CircularIconbtn(
                                            icon: CupertinoIcons.trash,
                                            iconChanged: CupertinoIcons.trash,
                                            backgroundColor: Color(0xFFf6f6f6)
                                                .withOpacity(0.3),
                                            iconColor: Colors.black,
                                            Functionality: () {
                                              setState(() {
                                                PdtOnCart.remove(
                                                    currentBagItem);
                                                lengthOfPrdtCart =
                                                    PdtOnCart.length;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    //price + quantity
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //PRICE
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            "₹ " + _price,
                                            textAlign: TextAlign.left,
                                            // maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Constants.secondaryColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),

                                        // QUANTITY BUTTON
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Row(
                                            children: [
                                              //Decrease Quantity
                                              GestureDetector(
                                                onTap: () {
                                                  setState(
                                                    () {
                                                      PdtOnCart.remove(
                                                          currentBagItem);
                                                      lengthOfPrdtCart =
                                                          PdtOnCart.length;
                                                    },
                                                  );
                                                },
                                                child: Center(
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              // TEXT
                                              Text(
                                                "$quantityIndex",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),

                                              //Increase Quantity
                                              GestureDetector(
                                                onTap: () {
                                                  // setState(() {
                                                  //   quantityIndex += 1;
                                                  // });
                                                },
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
  }
}
