import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:blckdrop/src/models/Model.dart';
import 'package:blckdrop/utils/utils.dart';
import 'package:blckdrop/utils/widget.dart';
import 'package:intl/intl.dart';

class AppMethods {
  //PRICE FORMATING
  String PriceFormat(double _price) {
    final numberFormat = NumberFormat('#,###.00', 'en_US');

    String price = numberFormat.format(_price);
    return price;
  }

  //SNACKBAR
  static addToCartSnackBarNotifier(ShoeModel data, BuildContext context) {
    bool contains = PdtOnCart.contains(data);

    if (contains == true) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBarWidget.ShowError(
          context,
          "You already have this item in the cart!",
          "🤓☝️",
          ContentType.failure));
    } else {
      PdtOnCart.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBarWidget.ShowError(
          context,
          "Successfully Added to your cart",
          'NICE 👍',
          ContentType.success));
    }
  }

  //SUBTOATL CALCULATION
  static String sumOfItemsOnBag() {
    double sumPrice = 0.0;
    for (ShoeModel bagModel in PdtOnCart) {
      sumPrice = sumPrice + bagModel.price;
    }
    String subtotal = AppMethods().PriceFormat(sumPrice);
    return subtotal;
  }

  //GRANDTOTAL CALCULATION
  static String grandTotal() {
    double sumPrice = 0.0;
    for (ShoeModel bagModel in PdtOnCart) {
      sumPrice = sumPrice + bagModel.price;
    }
    sumPrice = sumPrice + 100;
    String grandTotal = AppMethods().PriceFormat(sumPrice);
    return grandTotal;
  }
}



// class GlobalKeyProvider extends ChangeNotifier {
//   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   void updateScaffoldKey(GlobalKey<ScaffoldState> newKey) {
//     scaffoldKey = newKey;
//     notifyListeners();
//   }
// }
