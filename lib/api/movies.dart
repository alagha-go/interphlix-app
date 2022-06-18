import 'package:http/http.dart' as http;
import 'package:interphlix/controller/main.dart';
import 'package:interphlix/main.dart';
import 'package:interphlix/objects/recommendation.dart';

var headers = {"Cookie": "token=${token()}"};

var index = 0;

getHomeMovies() async {
  if (dataHolder.value.recommendation != null) {
    return "";
  }
  final response = await http.get(
    Uri.parse("${apisdomain}/"),
    headers: headers,
  );
  try {
    Recommendation recommendation = Recommendation.fromRawJson(response.body);
    dataHolder.update((model) {
      model.recommendation = recommendation;
    });
    return "";
  } catch (err) {
    print(err);
  }
  return "";
}

String token() {
  return DB.read("token");
}
