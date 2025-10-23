package com.mybatis.common.template;

import com.mybatis.common.dto.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int totalRecord, int nowPage, int numPerPage, int pagePerBlock) {
		int totalPage = (int)Math.ceil(totalRecord / (double)numPerPage);
		int startPage = (nowPage-1) / pagePerBlock * pagePerBlock + 1;
		int endPage = startPage+pagePerBlock-1;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		return new PageInfo(totalRecord,nowPage,numPerPage,pagePerBlock,totalPage,startPage,endPage);
	}
}
