import 'package:flutter/material.dart';
import 'package:news_app/common/app_colors.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:provider/provider.dart';
import '../../gen/assets.gen.dart';
import '../widgets/custom_drop_down_menu.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.blackColor,
        child: Column(
          children: [
            Container(
              height: 200,
              color: AppColors.whiteColor,
              alignment: Alignment.center,
              child: Text(
                'News App',
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
                spacing: 24,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Provider.of<CategoryProvider>(
                        context,
                        listen: false,
                      ).emptyCategory();
                    },
                    child: Row(
                      spacing: 8,
                      children: [
                        Assets.mainLayer.drawerIcons.home.svg(
                          height: 24,
                          width: 24,
                        ),
                        Text(
                          'Go to home',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: AppColors.whiteColor),
                  Row(
                    spacing: 8,
                    children: [
                      Assets.mainLayer.drawerIcons.brush.svg(
                        height: 24,
                        width: 24,
                      ),
                      Text(
                        'Theme',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  CustomDropDownMenu(
                    items: [
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text(
                          'Arabic',
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
                          'Wnglish',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                  Divider(color: AppColors.whiteColor),
                  Row(
                    spacing: 8,
                    children: [
                      Assets.mainLayer.drawerIcons.globe.svg(
                        height: 24,
                        width: 24,
                      ),
                      Text(
                        'Language',
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
                          'Dark',
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
                          'Light',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {},
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
