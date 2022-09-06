part of '../imports/app_imports.dart';

class AppSvg {
  static SvgPicture account = SvgPicture.asset(AppIcons.account, width: 45,height: 45,color: AppThemeChoose.getMode()? AppColors.part_dark :AppColors.part_light,);
  static SvgPicture logout = SvgPicture.asset(AppIcons.logout, width: 45,height: 45,color: AppThemeChoose.getMode()? AppColors.part_dark :AppColors.part_light,);
  static SvgPicture settings = SvgPicture.asset(AppIcons.settings, width: 45,height: 45,color: AppThemeChoose.getMode()? AppColors.part_dark :AppColors.part_light,);
  static SvgPicture cart = SvgPicture.asset(AppIcons.cart, width: 45,height: 45,color: AppThemeChoose.getMode()? AppColors.part_dark :AppColors.part_light,);
  static SvgPicture data = SvgPicture.asset(AppIcons.data, width: 45,height: 45,color: AppThemeChoose.getMode()? AppColors.part_dark :AppColors.part_light,);
  static SvgPicture information = SvgPicture.asset(AppIcons.information, width: 45,height: 45,color: AppThemeChoose.getMode()? AppColors.part_dark :AppColors.part_light,);
  static SvgPicture notification = SvgPicture.asset(AppIcons.notification, width: 45,height: 45,color: AppThemeChoose.getMode()? AppColors.part_dark :AppColors.part_light,);
  static SvgPicture staff = SvgPicture.asset(AppIcons.staff, width: 45,height: 45,color: AppThemeChoose.getMode()? AppColors.part_dark :AppColors.part_light,);
}