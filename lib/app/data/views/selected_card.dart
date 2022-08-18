import 'package:flutter/material.dart';

class SelectedCard extends StatelessWidget {
  final String imagePath;
  final String textTitle;
  final bool selected;
  final VoidCallback onPressed;
  final bool showImage;

  const SelectedCard(
      {Key? key,
      required this.imagePath,
      required this.textTitle,
      required this.selected,
      required this.showImage,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Stack(
        children: [
          if (showImage == true)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  imagePath,
                  width: size.width * 0.68,
                  height: 70,
                  alignment: Alignment.bottomCenter,
                  color: selected
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).textTheme.caption?.color,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                  side: BorderSide(
                color: selected
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.outline,
              )),
              child: Row(
                children: [
                  Text(
                    textTitle,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          fontSize: 14,
                          fontFamily: 'GilroyMedium',
                          color: selected
                              ? Theme.of(context).colorScheme.primary
                              : null,
                        ),
                  ),
                ],
              ),
            ),
          ),
          if (selected)
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.verified_rounded,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
        ],
      ),
    );
  }
}
