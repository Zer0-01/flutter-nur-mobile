enum Environment { dev_mock, dev, prod, test }

class ProfileConstants {
  static Map<String, dynamic>? _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev_mock:
        _config = _Config.dev_mockConstants;
      case Environment.dev:
        _config = _Config.devConstants;
        break;
      case Environment.test:
        _config = _Config.testConstants;
        break;
      case Environment.prod:
        _config = _Config.prodConstants;
        break;
    }
  }

  static bool get isMock {
    return _config == _Config.dev_mockConstants;
  }

  static bool get isProduction {
    return _config == _Config.prodConstants;
  }

  static bool get isDevelopment {
    return _config == _Config.devConstants;
  }

  static bool get isTest {
    return _config == _Config.testConstants;
  }

  static get api {
    return _config![_Config.api];
  }
}

class _Config {
  static const api = "API";

  static Map<String, dynamic> dev_mockConstants = {
    api: "mock",
  };

  static Map<String, dynamic> devConstants = {
    api: "http://localhost:3001",
  };

  static Map<String, dynamic> testConstants = {
    api: "mock",
  };

  static Map<String, dynamic> prodConstants = {
    api: "https://dhw-api.onrender.com/api",
  };
}
