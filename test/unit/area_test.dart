import 'package:classwork/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Area of the circle with radius 1 should be 3.141592", () {
    // Arrange
    Area area = Area();
    // Act
    double result = area.circle(1);
    // Assert
    expect(result, 3.141592);
  });

  test("Area of the circle with radius -1 should throw an exception", () {
    // Arrange
    Area area = Area();
    
    // Assert
    expect(() => area.circle(-1), throwsException);
  });

  test("Area of the circle with radius 0 should be 0", () {
    // Arrange
    Area area = Area();
    // Act
    double result = area.circle(0);
    // Assert
    expect(result, 0);
  });

  test("Square of 0 is 0", () {
    num squareNum(double number) {
      return number.square;
    }

    num squaredNum = squareNum(0);

    expect(squaredNum, 0);
  });
}
