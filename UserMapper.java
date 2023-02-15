package mapper;

import pojo.Account;
import pojo.User;

public interface UserMapper {

    String checkPID(String pid);

    User userLogin(String name, String password);

    int addUser(User user);
    

    int getMax();

    int returnMax(int max);

    int deleteMax(int max);

    String checkUsername(String username);
}
