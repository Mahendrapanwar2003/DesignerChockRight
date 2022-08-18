import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:the_designer_chowk/app/common_methods/common_methods.dart';

class SendRequest extends StatelessWidget {
  const SendRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.03),
          Center(
              child: Text('Send Request'.tr,
                  style: Theme.of(context).textTheme.bodyText2)),
          SizedBox(height: size.height * 0.02),
          Text(
            'Mobile Number'.tr,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 13,
                color: Theme.of(context).textTheme.caption?.color),
          ),
          SizedBox(height: size.height * 0.02),
          TextField(
            maxLength: 10,
            style: Theme.of(context).textTheme.caption,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1,color: Theme.of(context).colorScheme.primary),
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Icon(Icons.phone_android_rounded),
                ),
                hintText: "+91 98251 65472",
                constraints: const BoxConstraints(maxHeight: 30,minHeight: 10),
                counterText: ""),
            keyboardType: TextInputType.number,
          ),
          Text(
            'Massage'.tr,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 13,
                color: Theme.of(context).textTheme.caption?.color),
          ),
        ],
      ),
    );
  }
}
