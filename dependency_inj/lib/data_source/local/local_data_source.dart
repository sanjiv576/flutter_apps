import '../../model/user.dart';

// Step: 2
class LocalDataSource {
  List<User> users = [
    User(id: 1, name: 'Local John', dob: '1/6/2001', birthTime: '14:22'),
    User(id: 2, name: 'Local Jane', dob: '12/12/2014', birthTime: '12:22'),
    User(id: 3, name: 'Sanjiv Shrestha', dob: '15/6/2016', birthTime: '10:30'),
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
