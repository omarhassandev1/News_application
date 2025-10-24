import '../gen/assets.gen.dart';

enum CategoryEnum{
  general(name: 'General',),
  business(name: 'Business'),
  entertainment(name: 'Entertainment'),
  health(name: 'Health'),
  science(name: 'Science'),
  technology(name: 'Technology'),
  sports(name: 'Sports');

  final String name;


  const CategoryEnum({required this.name});

  String get imagePath{
    switch (this){
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