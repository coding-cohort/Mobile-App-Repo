// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

//run with command    flutter driver --target=test_driver/e2e.dart

void main() {
  group('CBT App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final textFinder = find.byValueKey('text');
    final buttonFinder = find.byValueKey('buttonContainer');
    final signupTextFinder = find.byValueKey('signUpText');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('text of landing page - join us', () async {
      // Use the `driver.getText` method to verify the text on landing page button
      expect(await driver.getText(textFinder), "Join us");
    });

    test('opens the signup page', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      //verify, sign up page opens
      expect(await driver.getText(signupTextFinder),
          "Managing pain can be tough.\n\n Get help from Debbie - sign up now!");
    });
  });
}
