// Note: pascal case for class name

/*

Here, data are locally stored in database like sqlite when there is no internet connectivity 

--> allow to get user locally
--> allow to add user locally
*/
import '../../model/user.dart';

class LocalDataSource {
  List<User> userList = [
    User(id: 1, age: 22, name: 'Local Sanjiv'),
    User(id: 2, age: 29, name: 'Local Sarita'),
  ];

  // add user locally

  bool addUser({required User user}) {
    userList.add(user);
    return true;
  }

  // get all users of locally

  List<User> getAllUsers() {
    return userList;
  }
}
