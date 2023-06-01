import '../../model/user.dart';

// Step: 2
class LocalDataSource {
  List<User> users = [
    User(id: 1, name: 'Local John', age: 30),
    User(id: 2, name: 'Local Jane', age: 34),
  ];

// add user
  bool addUser(User user) {
    users.add(user);
    return true;
  }

  // get user

  List<User> getUser() {
    return users;
  }
}
