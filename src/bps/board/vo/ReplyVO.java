package bps.board.vo;

public class ReplyVO {
    private int com_no;
    private int board_no;
    private String com_name;
    private String com_con;
    
    public int getCom_no() {
        return com_no;
    }
    public void setCom_no(int com_no) {
        this.com_no = com_no;
    }
    public int getBoard_no() {
        return board_no;
    }
    public void setBoard_no(int board_no) {
        this.board_no = board_no;
    }
    public String getCom_name() {
        return com_name;
    }
    public void setCom_name(String com_name) {
        this.com_name = com_name;
    }
    public String getCom_con() {
        return com_con;
    }
    public void setCom_con(String com_con) {
        this.com_con = com_con;
    }
    
    @Override
    public String toString() {
        return "ReplyVO [com_no=" + com_no + ", board_no=" + board_no + ", com_name=" + com_name + ", com_con="
                + com_con + "]";
    }
    
    
    
    
}
