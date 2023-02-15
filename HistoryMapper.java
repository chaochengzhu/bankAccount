package mapper;

public interface HistoryMapper {

    int updateHistory(String pid, String fromAct, String toAct, double balance);

    int updateHistory1(String pid,  String fromAct,double balance );
}
