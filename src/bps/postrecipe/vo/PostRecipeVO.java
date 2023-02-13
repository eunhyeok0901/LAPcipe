package bps.postrecipe.vo;

public class PostRecipeVO {
    private int post_no;
    private String mem_id;
    private int rec_no;
    private int id;
    
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPost_no() {
        return post_no;
    }
    public void setPost_no(int post_no) {
        this.post_no = post_no;
    }
    public String getMem_id() {
        return mem_id;
    }
    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }
    public int getRec_no() {
        return rec_no;
    }
    public void setRec_no(int rec_no) {
        this.rec_no = rec_no;
    }
}
