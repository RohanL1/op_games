import 'dart:math';

int getRandomNumberWithLimit(int upperLimit) {
  Random random = Random();
  return random.nextInt(upperLimit + 1);
}

List<int> getRandomNumbersWithSumLimit(int upperRange, int sumLimit) {
  Random random = Random();

  // Generate two random numbers within the specified upper range
  int randomNumber1 = random.nextInt(upperRange + 1);
  int remainingLimit = sumLimit - randomNumber1;
  int randomNumber2 = random.nextInt(min(upperRange + 1, remainingLimit + 1));

  // Return the two random numbers
  return [randomNumber1, randomNumber2];
}
