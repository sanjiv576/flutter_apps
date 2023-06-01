import '../../model/user.dart';

// Step 3
class RemoteDataSource {
  List<User> users = [
    User(id: 1, name: 'Remote John', dob: '1/6/2001', birthTime: '14:22'),
    User(id: 2, name: 'Remote Jane', dob: '12/12/2014', birthTime: '12:22'),
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
