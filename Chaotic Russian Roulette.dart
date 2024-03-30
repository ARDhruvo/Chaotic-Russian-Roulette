/* 
 * @author Kashikizu/ARDhruvo
 * Initial Completion Date: 30/03/2024 (dd/mm/yyyy)
 */

import 'dart:math';

void main() {
  Revolver r = Revolver();
  r.ocd();
}

class Revolver extends GunCalc {
  Revolver() {
    var gun = [0, 0, 0, 0, 0, 0];
    loadGun(gun);
    shootGun(gun);
    if (lifeCheck == 0) {
      print("You lost...");
    } else {
      print("You won!");
    }
    checkGun(gun);
  }
}

class GunCalc extends UnivCalc {
  GunCalc() {}

  void loadGun(var list) {
    int bullets = univRoll(6);
    int dropped = 0;
    print("$bullets bullets were taken");
    for (int i = 1; i <= bullets; i++) {
      int slots = univRoll(6);
      if (list[slots] != 0) {
        dropped++;
      } else {
        list[slots]++;
      }
    }
    if (dropped != 0) {
      print("$dropped bullets were dropped");
    }
    print("${bullets - dropped} bullets were loaded");
    ocd();
  }

  void shootGun(var list) {
    int pull = univRoll(6);
    if (pull == 0) {
      print("No shots were fired");
    } else {
      print("There will be $pull shots fired");
      ocd();
      for (int i = 1; i <= pull; i++) {
        int slots = univRoll(6);
        print("Slot ${slots + 1} was fired");
        if (list[slots] != 0) {
          print("There was a bullet");
          lifeCheck = 0;
          break;
        } else {
          print("There wasnt any bullet");
        }
      }
    }
    ocd();
  }

  void checkGun(var list) {
    ocd();
    print("Bullets were in slot(s):");
    for (int i = 0; i < list.length; i++) {
      if (list[i] != 0) {
        print(i + 1);
      }
    }
  }
}

class UnivCalc {
  UnivCalc() {}

  int lifeCheck = 1;

  //Calculates % stats
  double percCalc(int f, n) {
    double percFace = (f / n) * 100;
    double percRound = double.parse(percFace.toStringAsFixed(2));
    return percRound;
  }

  //Rolls to get a case out of n cases
  int univRoll(int n) {
    int cases = rand() % n;
    return cases;
  }

  //Returns a random number
  int rand() {
    int value = Random().nextInt(6969);
    return value;
  }

  void ocd() {
    print("");
  }

  //Returns a random number between 10; Used for determining loop numbers
  int gen() {
    int value = Random().nextInt(10);
    return value;
  }
}
