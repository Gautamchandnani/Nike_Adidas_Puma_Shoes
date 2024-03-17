import 'package:blckdrop/src/models/Model.dart';
import 'package:blckdrop/src/services/appmethods.dart';
import 'package:blckdrop/utils/utils.dart';
import 'package:blckdrop/utils/widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NikeWidget extends StatefulWidget {
  const NikeWidget({super.key});

  @override
  State<NikeWidget> createState() => _NikeWidgetState();
}

class _NikeWidgetState extends State<NikeWidget> {
  int activeIndex = 0;
  final _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              reverse: false,
              autoPlay: true,
              viewportFraction: 0.90,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            items: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: BannerWidget(
                    imageUrl: "assets/images/nike/carousel/Banner2.png"),
              ),
              BannerWidget(
                  imageUrl: "assets/images/nike/carousel/Banner1.png", x: -0.3),
              BannerWidget(
                  imageUrl: "assets/images/nike/carousel/Banner3.png",
                  boxfitData: BoxFit.fitWidth),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: 3,
            effect: WormEffect(
              activeDotColor: Constants.featuresColor,
              dotHeight: 8,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment(-0.92, 0),
          child: Text(
            "JUST IN",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: NikeStocks.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 0,
            mainAxisExtent: 288,
          ),
          itemBuilder: (context, index) {
            ShoeModel model = NikeStocks[index];
            return ShoeTile(
              pdtName: model.Name,
              pdtDetails: model.DetailName,
              pdtPrice: model.price,
              ImageUrl: model.imgAddress,
              onImageTap: () {
                AppMethods.addToCartSnackBarNotifier(model, context);
              },
              model: model,
            );
          },
        ),
      ],
    );
  }
}
