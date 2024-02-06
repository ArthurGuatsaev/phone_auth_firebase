part of '../../theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color stepDis;
  final Color stepAc;
  final Color regText;
  final Color bottomReg;
  final Color disableMenu;
  final Color bottom;
  final Color profileHint;
  final Color bg;

  const ThemeColors({
    required this.stepAc,
    required this.stepDis,
    required this.regText,
    required this.bottomReg,
    required this.disableMenu,
    required this.bottom,
    required this.profileHint,
    required this.bg,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? stepAc,
    Color? stepDis,
    Color? regText,
    Color? bottomReg,
    Color? disableMenu,
    Color? bottom,
    Color? profileHint,
    Color? bg,
  }) {
    return ThemeColors(
      stepAc: stepAc ?? this.stepAc,
      stepDis: stepDis ?? this.stepDis,
      regText: regText ?? this.regText,
      bottomReg: bottomReg ?? this.bottomReg,
      disableMenu: disableMenu ?? this.disableMenu,
      bottom: bottom ?? this.bottom,
      profileHint: profileHint ?? this.profileHint,
      bg: bg ?? this.bg,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      stepAc: Color.lerp(stepAc, other.stepAc, t)!,
      stepDis: Color.lerp(stepDis, other.stepDis, t)!,
      bottomReg: Color.lerp(bottomReg, other.bottomReg, t)!,
      regText: Color.lerp(regText, other.regText, t)!,
      disableMenu: Color.lerp(disableMenu, other.disableMenu, t)!,
      bottom: Color.lerp(bottom, other.bottom, t)!,
      profileHint: Color.lerp(profileHint, other.profileHint, t)!,
      bg: Color.lerp(bg, other.bg, t)!,
    );
  }

  static get light => ThemeColors(
        stepAc: AppColors.stepAc,
        stepDis: AppColors.lightGrey,
        regText: AppColors.textRg,
        bottomReg: AppColors.buttonRg,
        disableMenu: AppColors.dissable,
        bottom: AppColors.black.withOpacity(0.3),
        profileHint: AppColors.profileHint,
        bg: AppColors.bg,
      );

  static get dark => ThemeColors(
        stepAc: AppColors.stepAc,
        stepDis: AppColors.lightGrey,
        regText: AppColors.textRg,
        bottomReg: AppColors.buttonRg,
        disableMenu: AppColors.dissable,
        profileHint: AppColors.profileHint,
        bg: AppColors.bg,
        bottom: AppColors.black.withOpacity(0.3),
      );
}
