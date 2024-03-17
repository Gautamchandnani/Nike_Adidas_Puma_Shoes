// ignore_for_file: must_be_immutable

import 'package:blckdrop/utils/utils.dart';

class CircularIconbtn extends StatefulWidget {
  CircularIconbtn({
    super.key,
    required this.icon,
    this.iconChanged,
    this.width,
    this.heigth,
    this.size,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.iconColorChanged,
    this.Functionality,
  });

  final double? width, heigth, size;
  late IconData? icon, iconChanged;
  late Color? backgroundColor, iconColor, iconColorChanged;
  final VoidCallback? Functionality;

  @override
  State<CircularIconbtn> createState() => _CircularIconbtnState();
}

class _CircularIconbtnState extends State<CircularIconbtn> {
  bool _onTap = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: widget.backgroundColor,
      ),
      child: IconButton(
        onPressed: () {
          _onTap = !_onTap;
          widget.Functionality!();
        },
        icon: Icon(_onTap ? widget.iconChanged : widget.icon),
        color: _onTap ? widget.iconColorChanged : widget.iconColor,
      ),
    );
  }
}
