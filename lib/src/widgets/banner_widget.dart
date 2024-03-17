import 'package:blckdrop/utils/utils.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.imageUrl,
    this.boxfitData = BoxFit.cover,
    this.width = 100,
    this.x = 0,
    this.y = 0,
  });

  final String imageUrl;
  final BoxFit boxfitData;
  final double width;
  final double x;
  final double y;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image(
            alignment: Alignment(x, y),
            image: AssetImage(
              imageUrl,
            ),
            fit: boxfitData,
          ),
        ),
      ),
    );
  }
}
