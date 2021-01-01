// import 'package:flutter_driver/flutter_driver.dart';
// import 'package:flutter_test/flutter_test.dart';
// import './instrucoes.dart';

// void main() {
//   group('main screen', () {
//     FlutterDriver driver;

//     Future<void> tap(SerializableFinder element) async {
//       await driver.tap(element);
//     }

//     Future<void> type(SerializableFinder element, String text) async {
//       await tap(element);
//       await driver.enterText(text);
//     }

//     SerializableFinder findByKey(String key) {
//       return find.byValueKey(key);
//     }

//     setUpAll(() async {
//       driver = await FlutterDriver.connect();
//     });

//     tearDownAll(() async {
//       if (driver != null) {
//         await driver.close();
//       }
//     });

//     test('should login successfully', () async {
//       SerializableFinder button = findByKey("button");

//       await tap(button);

//       /**
//        * The driver is the one that sends the message and the DataHandler
//        * is the one listening in the app Isolate and depending on the message
//        * received will be able to mock that a certain request returns a
//        * certain value.
//        */
// driver.requestData("login");

// SerializableFinder email = findByKey("email");
// SerializableFinder pwd = findByKey("pwd");

// await type(email, "thisisatest@thisisatest.com");
// await type(pwd, "thisisatest");

//       SerializableFinder button = findByKey("button");
//       await tap(button);

//       expect(await findByKey("authentication_success"), isTrue,
//           reason: "TEST KO: Authentication did not succeed.");
//     });
//   });
// }
