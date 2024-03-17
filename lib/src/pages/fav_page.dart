import 'package:blckdrop/src/models/Model.dart';
import 'package:blckdrop/src/services/appmethods.dart';
import 'package:blckdrop/utils/utils.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "💖",
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        toolbarHeight: 90,
      ),
      // backgroundColor: Colors.blue,
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: FavoriteNikes.length,
        itemBuilder: (context, index) {
          ShoeModel Fav = FavoriteNikes[index];
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
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
                        // width: MediaQuery.of(context).size.width,
                        image: AssetImage(
                          Fav.imgAddress,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(Fav.Name),
                  Text(
                    "Rs ${AppMethods().PriceFormat(Fav.price)}",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
