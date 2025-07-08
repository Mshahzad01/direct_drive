import 'package:direct_drive/src/constant/asset_string.dart';
import 'package:direct_drive/src/core/extension/context_ext._extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
         // foregroundColor: Colors.black,
          backgroundColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          
          ),
          elevation: 1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
               SvgPicture.asset(
                AssetString.googleicon, 
                height: 24,
                width: 24,
              ),
            
         const SizedBox(width: 35),
            
                Text(
                "Sign in with Google",textAlign: TextAlign.center,
                style: context.mytexttheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
