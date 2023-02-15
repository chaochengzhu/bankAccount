package service.impl;


import mapper.AccountMapper;
import mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import pojo.Account;
import pojo.User;
import service.UserService;
import util.SqlSessionUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class UserServiceImpl implements UserService {

    HttpServletRequest request = null;

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public HttpServletResponse getResponse() {
        return response;
    }

    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }

    HttpServletResponse response = null;

    public UserServiceImpl(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    //private AccountMapper accountMapper= SqlSessionUtil.openSession().getMapper(AccountMapper.class);
//    private HistoryMapper historyMapper=SqlSessionUtil.openSession().getMapper(HistoryMapper.class);


    @Override
    public void login() throws IOException {

        UserMapper userMapper = SqlSessionUtil.openSession().getMapper(UserMapper.class);

        HttpSession session = null;
        SqlSession sqlSession = SqlSessionUtil.openSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");


        User user = userMapper.userLogin(username, password);


        SqlSessionUtil.close(sqlSession);

        if (user != null) {
            session = request.getSession();
            session.setAttribute("user", user);


            response.sendRedirect(request.getContextPath() +
                    "/service.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/loginfall.jsp");
        }

    }

    @Override
    public void register() throws IOException {
        UserMapper userMapper = SqlSessionUtil.openSession().getMapper(UserMapper.class);
        AccountMapper accountMapper = SqlSessionUtil.openSession().getMapper(AccountMapper.class);
        SqlSession sqlSession = SqlSessionUtil.openSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String[] sex1 = request.getParameterValues("sex");
        Character sex = sex1[0].charAt(0);
        String dob = request.getParameter("dob");
        String PID = request.getParameter("PID");
        String telephone = request.getParameter("telephone");
        String address = request.getParameter("address");

        Double openMoney = Double.parseDouble(request.getParameter("openMoney"));


        int max = userMapper.getMax();
        int deleteMax = userMapper.deleteMax(max);

        if (deleteMax != 1) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
        max++;

        int returnMax = userMapper.returnMax(max);
        String max1 = "act" + max;

        if (returnMax != 1) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }

        Account account = new Account(max1, openMoney, PID);

        int count0 = accountMapper.addNewAccount(account);


        User user = new User(username, password, sex, dob, PID, telephone, address);


        int count = userMapper.addUser(user);

        sqlSession.commit();
        SqlSessionUtil.close(sqlSession);


        request.setAttribute("user", user);



        if (count != 1) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/registered_successfully.jsp");
        }


    }

    @Override
    public void transfer() throws IOException {
        AccountMapper accountMapper = SqlSessionUtil.openSession().getMapper(AccountMapper.class);
        SqlSession sqlSession = SqlSessionUtil.openSession();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");


        String PID = user.getPID();


        Account account = accountMapper.checkBalanceByPid(PID);


        String fromAct = account.getActno();
        String toAct = request.getParameter("toAct");

        if (fromAct == toAct) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }else {

            double balance = 0;

            try {
                balance = Double.parseDouble(request.getParameter("balance"));

            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/typeerror.jsp");
                return;
            }


            if (balance <= 0) {
                response.sendRedirect(request.getContextPath() + "/typeerrpr.jsp");
            }else{

            Account account1 = accountMapper.checkBalanceByActno(fromAct);


            Account account2 = accountMapper.checkBalanceByActno(toAct);
            if (account1.getBalance() < balance) {
                response.sendRedirect(request.getContextPath() + "/MoneyNotEnough.jsp");
            }else {

                account1.setBalance(account1.getBalance() - balance);
                account2.setBalance(account2.getBalance() + balance);


                int count = 0;
                count += accountMapper.updateAccount(account1);
                count += accountMapper.updateAccount(account2);


                sqlSession.commit();
                SqlSessionUtil.close(sqlSession);

                if (count != 2) {
                    response.sendRedirect(request.getContextPath() + "/error.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/success.jsp");
                }
                }
            }
        }


    }

    @Override
    public void checkPID() throws IOException {
        AccountMapper accountMapper = SqlSessionUtil.openSession().getMapper(AccountMapper.class);
        UserMapper userMapper = SqlSessionUtil.openSession().getMapper(UserMapper.class);
        SqlSession sqlSession = SqlSessionUtil.openSession();
        HttpSession session = request.getSession();
        Boolean flag = false;
        String pid = request.getParameter("PID");

        String PID = userMapper.checkPID(pid);
        if (PID != null) {
            flag = true;
        }


        SqlSessionUtil.close(sqlSession);

        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        if (flag) {
            writer.print("<font color='red'>sorry! user already exist</font>");
        } else {

        }


    }

    @Override
    public void checkBalance() throws IOException {
        AccountMapper accountMapper = SqlSessionUtil.openSession().getMapper(AccountMapper.class);
        SqlSession sqlSession = SqlSessionUtil.openSession();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String PID = user.getPID();

        Account account = accountMapper.checkBalanceByPid(PID);

        if(account==null){
            response.sendRedirect(request.getContextPath() + "/try_again.jsp");
            return;
        }

        Double balance = account.getBalance();
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();

        SqlSessionUtil.close(sqlSession);

        if (account == null) {
            writer.print("This is your balance " + 0);
        } else {
            writer.print("This is your balance " + balance);
        }


    }

    @Override
    public void withdraw() throws IOException {
        AccountMapper accountMapper = SqlSessionUtil.openSession().getMapper(AccountMapper.class);
        HttpSession session = request.getSession();
        SqlSession sqlSession = SqlSessionUtil.openSession();

        double balance1=0;

        try{
            balance1 = Double.parseDouble(request.getParameter("balance"));

        }catch(Exception e){
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/typeerror.jsp");
            return;
        }


        User user = (User) session.getAttribute("user");
        String PID = user.getPID();
        Account account1 = accountMapper.checkBalanceByPid(PID);

//        String actno = account1.getActno();


        if(account1.getBalance() < balance1 || balance1<0||account1==null){
            response.sendRedirect(request.getContextPath() + "/typeerror.jsp");

        }else {


            account1.setBalance(account1.getBalance() - balance1);
            int count = accountMapper.updateAccount(account1);

            sqlSession.commit();
            SqlSessionUtil.close(sqlSession);


//        int i =historyMapper.updateHistory1(PID, actno, balance1);

            if (count == 1) {
                response.sendRedirect(request.getContextPath() + "/success.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        }

    }

    @Override
    public void CheckAccountExistence() throws IOException {
        AccountMapper accountMapper = SqlSessionUtil.openSession().getMapper(AccountMapper.class);
        SqlSession sqlSession = SqlSessionUtil.openSession();
        boolean flag = false;
        String fromAct = request.getParameter("Act");
        String account = accountMapper.checkAccountExistence(fromAct);

        if (account != null) {
            flag = true;
        }

        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        SqlSessionUtil.close(sqlSession);

        if (flag) {

        } else {
            writer.print("<font color='red'>sorry! the user does not exist </font>");
        }


    }

    @Override
    public void deposit() throws IOException {
        AccountMapper accountMapper = SqlSessionUtil.openSession().getMapper(AccountMapper.class);
        HttpSession session = request.getSession();
        SqlSession sqlSession = SqlSessionUtil.openSession();

        double balance1=0;

        try{
            balance1 = Double.parseDouble(request.getParameter("balance"));

        }catch(Exception e){
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }


        User user = (User) session.getAttribute("user");
        String PID = user.getPID();
        Account account1 = accountMapper.checkBalanceByPid(PID);

        account1.setBalance(account1.getBalance() + balance1);


        int count = accountMapper.updateAccount(account1);

        // int i =accountMapper.updateHistory1(PID, account1.getActno(), balance1);

//        int i =historyMapper.updateHistory1(PID, account1.getActno(), balance1);

        if (count == 1) {
            response.sendRedirect(request.getContextPath() + "/success.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }

        sqlSession.commit();
        SqlSessionUtil.close(sqlSession);
    }

    private String generateKeyVal(String k,String v) {
        return String.format("\"%s\": \"%s\"", k, v);
    }

    @Override
    public void detail() throws IOException {


        AccountMapper accountMapper = SqlSessionUtil.openSession().getMapper(AccountMapper.class);
        HttpSession session = request.getSession();
        SqlSession sqlSession = SqlSessionUtil.openSession();


        User user = (User) session.getAttribute("user");
        String PID = user.getPID();
        Account account1 = accountMapper.checkBalanceByPid(PID);

        if (account1 == null){
            response.sendRedirect(request.getContextPath() + "/try_again.jsp");
        }else {

            response.setContentType("text/html");
            PrintWriter writer = response.getWriter();

//        User{username='1234', password='11111111', sex=M, dob=, PID='1212121212', telephone='1234567890', address='3333'} Account{actno='act9', balance=124364.0, PID='1212121212'}


            String username = user.getUsername();
            Character sex = user.getSex();
            String dob = user.getDob();
            String pid = user.getPID();
            String telephone = user.getTelephone();
            String address = user.getAddress();

            String actno = account1.getActno();
            double balance = account1.getBalance();
            String pid1 = account1.getPID();

            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("{");
            stringBuilder.append(generateKeyVal("username", username)).append(",");
            stringBuilder.append(generateKeyVal("sex", sex.toString())).append(",");
            stringBuilder.append(generateKeyVal("dob", dob)).append(",");
            stringBuilder.append(generateKeyVal("pid", pid)).append(",");
            stringBuilder.append(generateKeyVal("telephone", telephone)).append(",");
            stringBuilder.append(generateKeyVal("address", address)).append(",");
            stringBuilder.append(generateKeyVal("actno", actno)).append(",");
            stringBuilder.append(generateKeyVal("balance", balance + "")).append("}");

            writer.print(stringBuilder.toString());
            //writer.print(account1.toString()+""+user.toString());

            sqlSession.commit();
            SqlSessionUtil.close(sqlSession);
        }
    }

    @Override
    public void logout() throws IOException {
        SqlSession sqlSession = SqlSessionUtil.openSession();


        HttpSession session = request.getSession(false);
        if (session != null) {

            session.removeAttribute("user");
            session.invalidate();


            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }


        SqlSessionUtil.close(sqlSession);

    }

    @Override
    public void checkUsername() throws IOException {
        SqlSession sqlSession = SqlSessionUtil.openSession();
        String username = request.getParameter("username");
        UserMapper userMapper = SqlSessionUtil.openSession().getMapper(UserMapper.class);
        String user = userMapper.checkUsername(username);

        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();

        if (user == null) {

        } else {
            writer.print("Username already exist");
        }
    }


}
