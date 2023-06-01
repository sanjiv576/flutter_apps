/*

Here, data are stored in API  when there is  internet connectivity 

--> allow to get user 
--> allow to add user 
*/
import '../../model/user.dart';
// Note: pascal case for class name

class RemoteDataSource {
  List<User> userList = [
    User(id: 1, age: 22, name: 'Remote Sanjiv'),
    User(id: 2, age: 29, name: 'Remote Sarita'),
    User(id: 3, age: 12, name: 'Remote Sundar'),
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
