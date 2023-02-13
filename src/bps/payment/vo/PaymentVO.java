package bps.payment.vo;

public class PaymentVO {
    private int pay_no;
    private int buyed_no;
    private int payway;
    private int pay_cost;
    private String pay_date;
    public int getPay_no() {
        return pay_no;
    }
    public void setPay_no(int pay_no) {
        this.pay_no = pay_no;
    }
    public int getBuyed_no() {
        return buyed_no;
    }
    public void setBuyed_no(int buyed_no) {
        this.buyed_no = buyed_no;
    }
    public int getPayway() {
        return payway;
    }
    public void setPayway(int payway) {
        this.payway = payway;
    }
    public int getPay_cost() {
        return pay_cost;
    }
    public void setPay_cost(int pay_cost) {
        this.pay_cost = pay_cost;
    }
    public String getPay_date() {
        return pay_date;
    }
    public void setPay_date(String pay_date) {
        this.pay_date = pay_date;
    }
    
}
