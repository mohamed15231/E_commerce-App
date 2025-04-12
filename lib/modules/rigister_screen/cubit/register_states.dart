abstract class RegisterShopStates{}

class InitialRegisterShopStates extends RegisterShopStates{}

class LoadingRegisterShopStates extends RegisterShopStates{}
class SuccessRegisterShopStates extends RegisterShopStates{}
class ErrorRegisterShopStates extends RegisterShopStates{
  final String error;

  ErrorRegisterShopStates(this.error);
}

class ChangeIconRegisterStates extends RegisterShopStates{}


