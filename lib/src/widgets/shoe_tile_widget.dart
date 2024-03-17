import 'package:blckdrop/src/models/Model.dart';
import 'package:blckdrop/src/services/appmethods.dart';
import 'package:blckdrop/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:blckdrop/utils/widget.dart';

class ShoeTile extends StatefulWidget {
  const ShoeTile({
    super.key,
    required this.ImageUrl,
    required this.pdtName,
    required this.pdtDetails,
    required this.pdtPrice,
    required this.onImageTap,
    required this.model,
  });

  final String ImageUrl;
  final String pdtName;
  final String pdtDetails;
  final double pdtPrice;
  final VoidCallback onImageTap;
  final ShoeModel model;

  @override
  State<ShoeTile> createState() => _ShoeTileState();
}

class _ShoeTileState extends State<ShoeTile> {
  late double _price;
  late String __price;

  ShoeModel get shoeModel => shoeModel;

  void toggleFavorite(ShoeModel shoeModel) {
    setState(() {
      if (FavoriteNikes.contains(shoeModel)) {
        FavoriteNikes.remove(shoeModel);
      } else {
        FavoriteNikes.add(shoeModel);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _price = widget.pdtPrice as double;
    __price = AppMethods().PriceFormat(_price);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            //Thumbnail,Fav button
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFf6f6f6),
                    Color(0xFFf6f6f6),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 50,
                    spreadRadius: 7,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  //Thumbnial Image
                  GestureDetector(
                    onTap: widget.onImageTap,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            colors: [Color(0xFFf6f6f6), Color(0xFFf6f6f6)],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.darken,
                        child: Image(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          image: AssetImage(
                            widget.ImageUrl,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  //Favoirite btn
                  Positioned(
                    top: 5,
                    left: 5,
                    child: CircularIconbtn(
                      icon: Icons.favorite_border_rounded,
                      iconChanged: Icons.favorite_rounded,
                      iconColor: Colors.black,
                      iconColorChanged: Colors.redAccent,
                      Functionality: () {
                        toggleFavorite(widget.model);
                      },
                    ),
                  ),
                ],
              ),
            ),
            // (Nike + "") + Details + Price
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                alignment: Alignment(-0.98, 0),
                child: Text(
                  widget.pdtName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.rubikMonoOne(
                    fontSize: 16,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment(-0.98, 0),
              child: Text(
                widget.pdtDetails,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
            Container(
              alignment: Alignment(-0.94, 0),
              child: Text(
                "₹" + "${__price}",
                textAlign: TextAlign.left,
                // maxLines: 2,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.secondaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
