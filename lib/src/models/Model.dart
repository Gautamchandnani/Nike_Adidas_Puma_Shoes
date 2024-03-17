import 'package:blckdrop/utils/utils.dart';

class ShoeModel {
  String Name;
  String DetailName;
  double price;
  String imgAddress;

  ShoeModel({
    required this.Name,
    required this.DetailName,
    required this.price,
    required this.imgAddress,
  });
}

List<ShoeModel> PdtOnCart = [];

final List<ShoeModel> NikeStocks = [
  ShoeModel(
    Name: "Air Humara",
    DetailName: "Deep Royal BLue & Light Ultramarine",
    price: 14955,
    imgAddress: "assets/images/nike/shoes/airhumara.png",
  ),
  ShoeModel(
      Name: "Terminator High",
      DetailName: "Black and University Red",
      price: 12795.00,
      imgAddress: "assets/images/nike/shoes/terminatorhigh.png"),
  ShoeModel(
    Name: "Air Jordan 5",
    DetailName: "Navy",
    price: 19295.00,
    imgAddress: "assets/images/nike/shoes/airjordan5.png",
  ),
  ShoeModel(
    Name: 'NOCTA Glide',
    DetailName: 'Black and White',
    price: 13995.00,
    imgAddress: "assets/images/nike/shoes/noctaglide.png",
  ),
  ShoeModel(
    Name: "Air Force 1 Low",
    DetailName: "Colour of the Month",
    price: 13995.00,
    imgAddress: "assets/images/nike/shoes/airforce.png",
  ),
];

List<ShoeModel> FavoriteNikes = [];

// ADIDAS
final List<ShoeModel> AdidasStocks = [
  ShoeModel(
    Name: "ADIFOM CLIMACOOL",
    DetailName: "Better Scarlet / Better Scarlet / Red",
    price: 4003.77,
    imgAddress: "assets/images/adidas/shoes/AdifomClimacool.png",
  ),
  ShoeModel(
    Name: "NMD S1 MAHBS",
    DetailName: "Oatmeal / Oatmeal / Mint",
    price: 22999.00,
    imgAddress: "assets/images/adidas/shoes/NMDS1.png",
  ),
  ShoeModel(
    Name: "SUPERSTAR",
    DetailName: "Core Black",
    price: 8999.00,
    imgAddress: "assets/images/adidas/shoes/SuperstarShoes.png",
  ),
  ShoeModel(
    Name: "SAMBA OG",
    DetailName: "Core Black",
    price: 10999.00,
    imgAddress: "assets/images/adidas/shoes/Samba.png",
  ),
  ShoeModel(
    Name: "CRAZY IIINFINITY 003",
    DetailName: "Core Black",
    price: 15999.00,
    imgAddress: "assets/images/adidas/shoes/CrazyIIInfinity.png",
  ),
];

List<ShoeModel> FavoriteAdidas = [];

//PUMA
final List<ShoeModel> PUMAStocks = [
  ShoeModel(
    Name: "FENTY X PUMA AVANTI L",
    DetailName: "CLUB NAVY",
    price: 14999.00,
    imgAddress: "assets/images/puma/shoes/avanti.png",
  ),
  ShoeModel(
    Name: "BLACKTOP RIDER WASHED",
    DetailName: "ASTRO RED-TEAM REGAL RED",
    price: 8999.00,
    imgAddress: "assets/images/puma/shoes/blacktop.png",
  ),
  ShoeModel(
    Name: "MB.02 LOW",
    DetailName: "INTENSE RED",
    price: 12999.00,
    imgAddress: "assets/images/puma/shoes/mb02.png",
  ),
  ShoeModel(
    Name: "X RIPNDIP SLIPSTREAM",
    DetailName: "PUMA WHITE-BLACK",
    price: 11999.00,
    imgAddress: "assets/images/puma/shoes/slipstream.png",
  ),
  ShoeModel(
    Name: "X STAPLE SUEDE 2",
    DetailName: "FLAT LIGHT GRAY-COOL DARK GRAY",
    price: 11999.00,
    imgAddress: "assets/images/puma/shoes/suede.png",
  ),
];

List<ShoeModel> FavoritePuma = [];
