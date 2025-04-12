abstract class SearchStates{

}

class InitialSearchState extends SearchStates{}


class SuccessSearchState extends SearchStates{}
class LoadingSearchState extends SearchStates{}
class ErrorSearchState extends SearchStates{
  final error;
  ErrorSearchState(this.error);

}