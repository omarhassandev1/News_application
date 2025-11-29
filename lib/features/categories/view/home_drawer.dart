import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/app_colors.dart';
import 'package:news_app/common/settings_cubit/settings_cubit.dart';
import 'package:news_app/features/categories/view/widgets/custom_drop_down_menu.dart';
import 'package:news_app/features/categories/view_model/category_cubit.dart';

import '../../../gen/assets.gen.dart';
import '../../../generated/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.blackColor,
        child: Column(
          spacing: 10,
          children: [
            Container(
              height: 200,
              color: AppColors.whiteColor,
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.newsApp,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      context.read<CategoryCubit>().emptyCategory();
                    },
                    child: Row(
                      spacing: 10,
                      children: [
                        Assets.mainLayer.drawerIcons.home.svg(
                          height: 24,
                          width: 24,
                        ),
                        Text(
                          AppLocalizations.of(context)!.goToHome,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: AppColors.whiteColor),
                  Row(
                    spacing: 10,
                    children: [
                      Assets.mainLayer.drawerIcons.brush.svg(
                        height: 24,
                        width: 24,
                      ),
                      Text(
                        AppLocalizations.of(context)!.theme,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  CustomDropDownMenu<ThemeMode>(
                    items: [
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text(
                          AppLocalizations.of(context)!.dark,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text(
                          AppLocalizations.of(context)!.light,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        context.read<SettingsCubit>().changeTheme(value);
                      }
                    },
                  ),
                  Divider(color: AppColors.whiteColor),
                  Row(
                    spacing: 10,
                    children: [
                      Assets.mainLayer.drawerIcons.globe.svg(
                        height: 24,
                        width: 24,
                      ),
                      Text(
                        AppLocalizations.of(context)!.language,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  CustomDropDownMenu<String>(
                    items: [
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text(
                          AppLocalizations.of(context)!.arabic,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(
                          AppLocalizations.of(context)!.english,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        context.read<SettingsCubit>().changeLocale(value);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
