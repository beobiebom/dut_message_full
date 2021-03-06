import 'package:flutter/material.dart';
import 'package:mobile/core/constants/asset_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DUTMessageLogo extends StatefulWidget {
  const DUTMessageLogo({Key? key}) : super(key: key);

  @override
  State<DUTMessageLogo> createState() => _DUTMessageLogoState();
}

class _DUTMessageLogoState extends State<DUTMessageLogo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return ClipRect(
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: _animation.value,
              child: child,
            ),
          );
        },
        child: SizedBox(
          width: ScreenUtil().setWidth(220),
          height: ScreenUtil().setWidth(210),
          child: SvgPicture.asset(
            AssetPath.appLogo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
