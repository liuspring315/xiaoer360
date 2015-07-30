package com.xiaoer360.util;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class PagerTag extends TagSupport {
	/**
	 * <p>描述:[字段功能描述]</p>
	 */
	private static final long serialVersionUID = 1L;
	
	private int page= 1;   //页数记录
	private int pageSize = 20; // 每页要显示的记录数 
	private int totalNum = 0; // 总记录数 
	private int totalPage = 0;//总页数
	private String url;   //目的地URL 
	private String form=null; //想要提交的form名称
	
	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public int doStartTag() throws JspException {
		
		//通过总个数获取总页数
		if (totalNum % pageSize == 0)
			this.totalPage = totalNum / pageSize;
		else
			this.totalPage = totalNum / pageSize + 1;
		//页数的边界控制
		if (page < 1)
			page = 1;
		if (page > totalPage)
			page = totalPage;

		StringBuilder sb = new StringBuilder();
		sb.append("<div class=\"dataTables_info\" id=\"DataTables_Table_0_info\" role=\"status\" aria-live=\"polite\">");
		sb.append("第 ").append(page).append(" 页|每页 ").append(pageSize).append(" 条记录|共 ").append(totalNum).append(" 条记录");
		sb.append("</div> ");
		sb.append("<div class=\"dataTables_paginate paging_simple_numbers\" id=\"DataTables_Table_0_paginate\">");
		sb.append("<ul class=\"pagination\">");
		if(page <= 1) {
			sb.append("<li class=\"paginate_button previous disabled\" aria-controls=\"DataTables_Table_0\" tabindex=\"0\" id=\"DataTables_Table_0_previous\">" +
					"<a href=\"javascript:goPage(").append(page - 1).append(")\">上一页</a></li>");
		}
		int j = this.totalPage > 10?10:this.totalPage;
		for(int i = 0;i < j;i++){
			sb.append("<li class=\"paginate_button ").append(page == (i+1)?"active":"").append("\" aria-controls=\"DataTables_Table_0\" tabindex=\"0\"><a href=\"javascript:goPage(").append(i+1).append(")\">").append(i + 1).append("</a></li>");
		}
		if(page > 10){
			j = this.totalPage > 10?10:this.totalPage;
		}
		if(page < totalPage){
			sb.append("<li class=\"paginate_button next\" aria-controls=\"DataTables_Table_0\" tabindex=\"0\" id=\"DataTables_Table_0_next\">" +
					"<a href=\"javascript:goPage(").append(page + 1).append(")\">下一页</a></li>");
		}
		sb.append("</ul>");
		sb.append("</div> ");
		sb.append("<script type=\"text/javascript\">function goPage(p){");
		sb.append("		$(\"#").append(form).append("\").append('<input type=\"hidden\" id=\"page\" name=\"page\" value=\"'+p+'\"/>');");
		sb.append("$(\"#").append(form).append("\"+form).submit();");
		sb.append("}</script>");
		try {
			pageContext.getOut().println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	
}