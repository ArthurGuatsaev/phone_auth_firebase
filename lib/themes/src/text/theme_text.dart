part of '../../theme.dart';

class ThemeText extends ThemeExtension<ThemeText> {
  final TextStyle rgBody;
  final TextStyle rgButton;
  final TextStyle rgComment;
  final TextStyle rgTitle;
  final TextStyle rgLable;
  final TextStyle rgText;
  final TextStyle rgCode;
  final TextStyle profileHint;
  final TextStyle appbarTitle;
  const ThemeText({
    required this.rgBody,
    required this.rgButton,
    required this.rgComment,
    required this.rgLable,
    required this.rgText,
    required this.rgTitle,
    required this.rgCode,
    required this.profileHint,
    required this.appbarTitle,
  });

  @override
  ThemeExtension<ThemeText> copyWith({
    TextStyle? rgBody,
    TextStyle? rgButton,
    TextStyle? rgComment,
    TextStyle? rgTitle,
    TextStyle? rgLable,
    TextStyle? rgText,
    TextStyle? rgCode,
    TextStyle? profileHint,
    TextStyle? appbarTitle,
  }) {
    return ThemeText(
      rgBody: rgBody ?? this.rgBody,
      rgComment: rgComment ?? this.rgComment,
      rgButton: rgButton ?? this.rgButton,
      rgText: rgText ?? this.rgText,
      rgTitle: rgTitle ?? this.rgTitle,
      rgLable: rgLable ?? this.rgLable,
      rgCode: rgCode ?? this.rgCode,
      appbarTitle: appbarTitle ?? this.appbarTitle,
      profileHint: profileHint ?? this.profileHint,
    );
  }

  static get light => ThemeText(
        rgBody: rgBodyT.copyWith(color: AppColors.textRg),
        rgButton: rgButtonT.copyWith(color: AppColors.textRg),
        rgComment: rgCommentT.copyWith(color: AppColors.textRg),
        rgText: rgTextT.copyWith(color: AppColors.textRg),
        rgTitle: rgTitleT.copyWith(color: AppColors.textRg),
        rgCode: rgTitleT.copyWith(color: AppColors.textRg),
        rgLable: rgLableT.copyWith(color: AppColors.textRg),
        profileHint: profileHintT.copyWith(color: AppColors.profileHint),
        appbarTitle: appbarTitleT.copyWith(color: AppColors.black),
      );

  static get dark => ThemeText(
        rgBody: rgBodyT.copyWith(color: AppColors.textRg),
        rgButton: rgButtonT.copyWith(color: AppColors.textRg),
        rgComment: rgCommentT.copyWith(color: AppColors.textRg),
        rgText: rgTextT.copyWith(color: AppColors.textRg),
        rgTitle: rgTitleT.copyWith(color: AppColors.textRg),
        rgCode: rgCodeT.copyWith(color: AppColors.textRg),
        rgLable: rgLableT.copyWith(color: AppColors.textRg),
        profileHint: profileHintT.copyWith(color: AppColors.profileHint),
        appbarTitle: appbarTitleT.copyWith(color: AppColors.black),
      );

  @override
  ThemeExtension<ThemeText> lerp(
      covariant ThemeExtension<ThemeText>? other, double t) {
    if (other is! ThemeText) {
      return this;
    }
    return ThemeText(
      rgBody: TextStyle.lerp(rgBody, other.rgBody, t)!,
      rgButton: TextStyle.lerp(rgButton, other.rgButton, t)!,
      rgComment: TextStyle.lerp(rgComment, other.rgComment, t)!,
      rgLable: TextStyle.lerp(rgLable, other.rgLable, t)!,
      rgText: TextStyle.lerp(rgText, other.rgText, t)!,
      rgCode: TextStyle.lerp(rgCode, other.rgCode, t)!,
      rgTitle: TextStyle.lerp(rgTitle, other.rgTitle, t)!,
      profileHint: TextStyle.lerp(profileHint, other.profileHint, t)!,
      appbarTitle: TextStyle.lerp(appbarTitle, other.appbarTitle, t)!,
    );
  }
}
