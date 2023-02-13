package bps.util;

public class PageUtil {
	public static final int pageSize=8;

	public static final int blockpage=5;
	
	
	public static String pagingStr(int totalCount, int pageSize, int blockpage, int pageNum, String requrl) {
		String pagingStr = "";
		
		int totalPages = (int)(Math.ceil(((double)totalCount / pageSize)));
		
		int pageTemp = (((pageNum-1) / blockpage) * blockpage) + 1;
		
//		if(pageTemp != 1) {
//			pagingStr += "<a href='"+requrl + "?pageNum=1'>[첫 페이지]</a>";
//			pagingStr += "&nbsp;";
//			
//		}
		System.out.println(totalPages);
		System.out.println(pageTemp);
		
		
		System.out.println(totalCount);
		System.out.println(pageSize);
		System.out.println(blockpage);
		System.out.println(pageNum);
		System.out.println(requrl);
		
		
		int blockCount = 1;
		pagingStr += "<ul id='youngho_pages'>";
		while(blockCount <= blockpage && pageTemp <= totalPages) {
			if(pageTemp == pageNum) {
				// 현재 페이지는 링크를 걸지 않음 
				pagingStr += "<li class='youngho_page'>&nbsp;" + pageTemp + "&nbsp;</li>";
			}else {
				pagingStr += "<li class='youngho_page'>&nbsp;<a href='"+requrl+"?pageNum="+pageTemp+"'>"+pageTemp+"</a>&nbsp;</li>";
			}
			
			pageTemp++;
			blockCount++;
			
		}
		
		pagingStr += "</ul>";
		
		return pagingStr;
		
		
	}
	
	
	


}
