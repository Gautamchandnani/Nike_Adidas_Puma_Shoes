import 'package:blckdrop/utils/utils.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[200],
        width: width,
        height: height / 1.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FadeAnimation(
            //   delay: 0.5,
            //   child:
            //       Text("No shoes added!", style: AppThemes.bagEmptyListTitle),
            // ),
            // FadeAnimation(
            //   delay: 0.5,
            //   child: Text(
            //     "Once you have added, come back:)",
            //     style: AppThemes.bagEmptyListSubTitle,
            //   ),
            // ),

            Container(
              height: 300,
              child: Image.asset("assets/images/emptycart.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Your Cart is Empty",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                "There is nothing in your cart, Let's add some items",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
