import '../../model/user.dart';

// Step 3
class RemoteDataSource {
  List<User> users = [
    User(id: 1, name: 'Remote Sudip', age: 20),
    User(id: 2, name: 'Rmote Vicky', age: 14),
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
