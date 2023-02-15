package service;




import javax.servlet.ServletException;
import java.io.IOException;

public interface UserService {

    void login() throws IOException;

    void register() throws IOException;

    void transfer() throws IOException;

    void checkPID() throws IOException;

    void checkBalance() throws IOException;

    void withdraw() throws IOException;

    void CheckAccountExistence() throws IOException;

    void deposit() throws IOException;

    void detail() throws IOException;

    void logout() throws IOException;

    void checkUsername() throws IOException;
}
