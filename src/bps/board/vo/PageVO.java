package bps.board.vo;

public class PageVO {
    private int start;//현재페이지 글리스트 내의 시작번호
    private int end;//현재페이지 글리스트 내의 끝번호
    private int startPage;//브라우저에 출력되는 시작페이지
    private int endPage;//브라우저에 출력되는 끝페이지
    
    private int totalPage;//전체페이지
    private int count; //전체 글 개수
    
    private static int perList = 3; //한 페이지 당 출력되는 글의 갯수: 아코디언갯수
    private static int perPage = 5; //브라우저에 출력되는 페이지의 갯수
    
    
    public int getStart() {
        return start;
    }
    public void setStart(int start) {
        this.start = start;
    }
    public int getEnd() {
        return end;
    }
    public void setEnd(int end) {
        this.end = end;
    }
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }
    public int getEndPage() {
        return endPage;
    }
    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getCount() {
        return count;
    }
    public void setCount(int count) {
        this.count = count;
    }
    public static int getPerList() {
        return perList;
    }
    public static void setPerList(int perList) {
        PageVO.perList = perList;
    }
    public static int getPerPage() {
        return perPage;
    }
    public static void setPerPage(int perPage) {
        PageVO.perPage = perPage;
    }
    
    @Override
    public String toString() {
        return "PageVO [start=" + start + ", end=" + end + ", startPage=" + startPage + ", endPage=" + endPage
                + ", totalPage=" + totalPage + ", count=" + count + "]";
    }
    
    
    
    
}
