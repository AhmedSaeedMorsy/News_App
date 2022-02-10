abstract class AppStetes {}

class NewsInitState extends AppStetes{}

class ChangeBottomNavBarState extends AppStetes{}

class NewsGetBusinessSuccessState extends AppStetes{}
class NewsGetBusinessErrorState extends AppStetes{
  late final String error;
  NewsGetBusinessErrorState(this.error);
}
class NewsGetBusinessLoadingState extends AppStetes{}


class NewsGetSportsSuccessState extends AppStetes{}
class NewsGetSportsErrorState extends AppStetes{
  late final String error;
  NewsGetSportsErrorState(this.error);
}
class NewsGetSportsLoadingState extends AppStetes{}


class NewsGetScienceSuccessState extends AppStetes{}
class NewsGetScienceErrorState extends AppStetes{
  late final String error;
  NewsGetScienceErrorState(this.error);
}
class NewsGetScienceLoadingState extends AppStetes{}


class NewsGetSearchSuccessState extends AppStetes{}
class NewsGetSearchErrorState extends AppStetes{
  late final String error;
  NewsGetSearchErrorState(this.error);
}
class NewsGetsSearchLoadingState extends AppStetes{}

class NewsChangeMoodAppState extends AppStetes{}