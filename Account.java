package pojo;

public class Account {
    private String actno;
    private double balance;
    private String PID;

    public Account() {
    }

    public Account(String actno, double balance, String PID) {
        this.actno = actno;
        this.balance = balance;
        this.PID = PID;
    }

    public String getActno() {
        return actno;
    }

    public void setActno(String actno) {
        this.actno = actno;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getPID() {
        return PID;
    }

    public void setPID(String PID) {
        this.PID = PID;
    }

    @Override
    public String toString() {
        return "Account{" +
                "actno='" + actno + '\'' +
                ", balance=" + balance +
                ", PID='" + PID + '\'' +
                '}';
    }
}
