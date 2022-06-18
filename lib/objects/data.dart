import 'package:interphlix/objects/category.dart';
import 'package:interphlix/objects/recommendation.dart';
import 'package:interphlix/ui/pages/main.dart';

class Data {
  Recommendation? recommendation;
  List<Category>? categories;
  PageIndex? pageIndex;

  Data({this.recommendation, this.categories, this.pageIndex});
}
