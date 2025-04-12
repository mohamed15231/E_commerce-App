abstract class ShopAppStates{}


class ShopAppInitialState extends ShopAppStates{}

class ChangeBottomNavState extends ShopAppStates{}

class LoadingHomeDataState extends ShopAppStates{}

class SuccessHomeDataState extends ShopAppStates{}

class ErrorHomeDataState extends ShopAppStates{
  final error;
  ErrorHomeDataState(this.error);

}

class SuccessCategoryState extends ShopAppStates{}

class ErrorCategoryState extends ShopAppStates{
  final error;
  ErrorCategoryState(this.error);
}
class SuccessChangeFavoriteState extends ShopAppStates{}

class ErrorChangeFavoriteState extends ShopAppStates{
  final error;
  ErrorChangeFavoriteState(this.error);

}

class SuccessGetFavoritesScreen extends ShopAppStates{}

class LoadingGetFavoritesScreen extends ShopAppStates{}

class SuccessGetProfileScreen extends ShopAppStates{}

class ErrorGetProfileScreen extends ShopAppStates{
  final error;
  ErrorGetProfileScreen(this.error);

}
class LoadingUpdateSettingsScreen extends ShopAppStates{}

class SuccessUpdateSettingsScreen extends ShopAppStates{}

class ErrorUpdateSettingsScreen extends ShopAppStates{
  final error;
  ErrorUpdateSettingsScreen(this.error);

}

class ErrorGetFavoritesScreen extends ShopAppStates{
  final error;
  ErrorGetFavoritesScreen(this.error);

}


