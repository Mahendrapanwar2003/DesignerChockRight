
import 'package:flutter/material.dart';

abstract class Common{
  sizedBox({Size? size,IconData? icon});
}

class CommonWidgets extends Common {
  @override
  sizedBox({Size? size, IconData? icon}) {
   return
     SizedBox(
       height: size!.height*0.02,
       width: size.width*0.15,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisSize: MainAxisSize.min,
         children:  [
            Icon(
             icon,
             size: 20,
           ),
           SizedBox(width: size.width*0.04),
           SizedBox(
             height: size.height*0.04,
             child: const VerticalDivider(
               width: 1,
               endIndent: 2,
               color: Colors.grey,
             ),
           ),
           SizedBox(width: size.width*0.05),
         ],
       ),
     );
  }
}