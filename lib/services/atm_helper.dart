import 'package:oop_project_atm/model/user.dart';

class ATMHelper {
  static List<User> list = [new User(id: 1, balance: 5000, pin: 1234)];

  void addUser(User user) {
    list.add(user);
  }

  int getId() {
    if (list.length == 0)
      return 1;
    else
      return list[list.length - 1].id + 1;
  }

  bool contains(int id) {
    for (User e in list) {
      if (e.id == id) {
        return true;
      }
    }
    return false;
  }

  bool authenticate(int id, int pin) {
    for (User e in list) {
      if (e.id == id && e.pin == pin) {
        return true;
      }
    }
    return false;
  }

  User getUser(int id) {
    User user = new User(id: 0, balance: 0, pin: 0);
    for (User e in list) {
      if (e.id == id) {
        return e;
      }
    }
    return user;
  }
}
