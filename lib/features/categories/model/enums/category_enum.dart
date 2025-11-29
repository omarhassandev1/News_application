
import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/app_localizations.dart';

enum CategoryEnum {
  general,
  business,
  entertainment,
  health,
  science,
  technology,
  sports;

  String getName(BuildContext context) {
    switch (this) {
      case CategoryEnum.general:
        return AppLocalizations.of(context)!.general;
      case CategoryEnum.business:
        return AppLocalizations.of(context)!.business;
      case CategoryEnum.entertainment:
        return AppLocalizations.of(context)!.entertainment;
      case CategoryEnum.health:
        return AppLocalizations.of(context)!.health;
      case CategoryEnum.science:
        return AppLocalizations.of(context)!.science;
      case CategoryEnum.technology:
        return AppLocalizations.of(context)!.technology;
      case CategoryEnum.sports:
        return AppLocalizations.of(context)!.sports;
    }
  }

  String get imagePath {
    switch (this) {
      case general:
        return Assets.mainLayer.categoriesCard.general.path;
      case business:
        return Assets.mainLayer.categoriesCard.business.path;
      case entertainment:
        return Assets.mainLayer.categoriesCard.entertainment.path;
      case health:
        return Assets.mainLayer.categoriesCard.health.path;
      case science:
        return Assets.mainLayer.categoriesCard.science.path;
      case sports:
        return Assets.mainLayer.categoriesCard.sports.path;
      case technology:
        return Assets.mainLayer.categoriesCard.technology.path;
    }
  }
}
