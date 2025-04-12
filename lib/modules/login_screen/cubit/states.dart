abstract class LoginShopStates{}

class InitialShopStates extends LoginShopStates{}

class LoadingLoginShopStates extends LoginShopStates{}
class SuccessLoginShopStates extends LoginShopStates{}
class ErrorLoginShopStates extends LoginShopStates{
  final String error;

  ErrorLoginShopStates(this.error);
}

class ChangeIconShopStates extends LoginShopStates{}


