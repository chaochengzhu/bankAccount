package mapper;

import pojo.Account;

public interface AccountMapper {
    Account checkBalanceByActno(String act);

    int updateAccount(Account act);

    Account checkBalanceByPid(String pid);



    String checkAccountExistence(String fromAct);


    int updateHistory(String pid, String fromAct, String toAct, double balance);



    int addNewAccount(Account account);


}
