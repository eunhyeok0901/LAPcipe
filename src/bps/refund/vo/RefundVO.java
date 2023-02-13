package bps.refund.vo;

public class RefundVO {
    private int ref_no;
    private int pay_no;
    private String ref_date;
    private String ref_reason;
    public int getRef_no() {
        return ref_no;
    }
    public void setRef_no(int ref_no) {
        this.ref_no = ref_no;
    }
    public int getPay_no() {
        return pay_no;
    }
    public void setPay_no(int pay_no) {
        this.pay_no = pay_no;
    }
    public String getRef_date() {
        return ref_date;
    }
    public void setRef_date(String ref_date) {
        this.ref_date = ref_date;
    }
    public String getRef_reason() {
        return ref_reason;
    }
    public void setRef_reason(String ref_reason) {
        this.ref_reason = ref_reason;
    }
    
}
