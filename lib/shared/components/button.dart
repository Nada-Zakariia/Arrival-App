import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

Widget button({
  required String text,
  required VoidCallback onpress,
  required double width,
  required double height,
  required BuildContext context,
  IconData? icon,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colortheme.lightPurple,
        borderRadius: BorderRadius.circular(height * 0.4),
        boxShadow: [
          BoxShadow(
            color: colortheme.lightPurple.withOpacity(0.5),
            blurRadius: 12,
            offset: const Offset(0, 12),
          ),
          const BoxShadow(
            color: colortheme.lightPurple,
            offset: Offset(12, 0),
          ),
          const BoxShadow(
            color: colortheme.lightPurple,
            offset: Offset(-12, 0),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onpress,
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 17,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(text,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colortheme.white,
                            fontWeight: FontWeight.bold,
                          )),
                ],
              )
            : Text(text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colortheme.white,
                      fontWeight: FontWeight.bold,
                    )),
      ),
    );
