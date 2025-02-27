import 'package:flutter/material.dart';

extension SpacingExtension on double {
  /// Vertical Space
  Widget get toVSB {
    return SizedBox(
      height: this,
    );
  }

  /// Horizontal Space
  Widget get toHSB {
    return SizedBox(
      width: this,
    );
  }
}

