package servlet;

import pojo.User;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet({"/Userlogin","/register","/transfer","/checkPID","/checkBalance","/withdraw","/checkAccountExistence","/checkUsername","/deposit","/detail","/logout"})
public class BankServlet extends HttpServlet {
    UserService userService = null;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String servletPath = request.getServletPath();

        if ("/Userlogin".equals(servletPath)) {
            userService = new UserServiceImpl(request, response);
            userService.login();
        }

        if(userService==null){
            userService = new UserServiceImpl(request, response);
        }else {
            ((UserServiceImpl) userService).setRequest(request);
            ((UserServiceImpl) userService).setResponse(response);
        }


        HttpSession session = request.getSession();
//        if(session.getAttribute("user")==null){
//            response.sendRedirect(request.getContextPath()+"/index.jsp");
//            return;
//        }

        if ("/register".equals(servletPath)) {
            userService.register();
        } else if ("/transfer".equals(servletPath)) {
            userService.transfer();
        }else if("/checkPID".equals(servletPath)){
            userService.checkPID();
        }else if("/checkBalance".equals(servletPath)){
            userService.checkBalance();
        }else if("/withdraw".equals(servletPath)){
            userService.withdraw();
        }else if("/checkAccountExistence".equals(servletPath)){
            userService.CheckAccountExistence();
        }else if("/deposit".equals(servletPath)){
            userService.deposit();
        }else if("/detail".equals(servletPath)){
            userService.detail();
        }else if("/logout".equals(servletPath)){
            userService.logout();
        }else if("/checkUsername".equals(servletPath)){
            userService.checkUsername();
        }
    }

}
