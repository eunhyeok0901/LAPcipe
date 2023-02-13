package bps.board.vo;

public class BoardVO {
    private int board_no;
    private String board_date;
    private String board_con;
    private String board_title;
    private String mem_id;
    
    public int getBoard_no() {
        return board_no;
    }
    public void setBoard_no(int board_no) {
        this.board_no = board_no;
    }
    public String getBoard_date() {
        return board_date;
    }
    public void setBoard_date(String board_date) {
        this.board_date = board_date;
    }
    public String getBoard_con() {
        return board_con;
    }
    public void setBoard_con(String board_con) {
        this.board_con = board_con;
    }
    public String getBoard_title() {
        return board_title;
    }
    public void setBoard_title(String board_title) {
        this.board_title = board_title;
    }
    public String getMem_id() {
        return mem_id;
    }
    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }
    
    @Override
    public String toString() {
        return "BoardVO [board_no=" + board_no + ", board_date=" + board_date + ", board_con=" + board_con
                + ", board_title=" + board_title + ", mem_id=" + mem_id + "]";
    }
    
}
