import 'package:flutter/material.dart';

import '../theme/colors.dart';


// class CommonLoading extends StatelessWidget {
//   const CommonLoading(
//       {Key? key, this.color = AppColors.primary, this.size = 80})
//       : super(key: key);
//   final Color color;
//   final double size;
//
//   @override
//   Widget build(BuildContext context) {
//     return SpinKitPulse(
//       color: color,
//       size: size,
//     );
//   }
// }

class CommonNormalLoading extends StatelessWidget {
  const CommonNormalLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          backgroundColor: AppColors.grey.withOpacity(.5),
          valueColor: const AlwaysStoppedAnimation(AppColors.white),
          strokeWidth: 5.3,
        ),
      ),
    );
  }
}
