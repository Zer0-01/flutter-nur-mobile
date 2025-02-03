import 'package:http/http.dart' as http;

class HttpUtils {
  static http.Client? _httpClient;

  static void setHttpClient(http.Client client) {
    _httpClient = client;
  }

  static void resetHttpClient() {
    _httpClient = null;
  }

  static http.Client get client {
    return _httpClient ?? http.Client();
  }

  static final _defaultHttpHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  static final _customHttpHeaders = <String, String>{};

  static void addCustomHttpHeaders(String key, String value) {
    _customHttpHeaders[key] = value;
  }

  static Future<Map<String, String>> headers() async {
    Map<String, String> headerParameters = <String, String>{};

    if (_customHttpHeaders.isNotEmpty) {
      headerParameters.addAll(_customHttpHeaders);
      _customHttpHeaders.clear();
    } else {
      headerParameters.addAll(_defaultHttpHeaders);
    }

    return headerParameters;
  }
}
