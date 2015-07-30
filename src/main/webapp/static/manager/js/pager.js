var PagerTag = {
    page: 1,  //页数记录
    pageSize : 20, // 每页要显示的记录数 
    totalNum : 0, // 总记录数 
    totalPage : 0,//总页数
    showPagerTag:function(callback,form,p){
        page = p.pageNumber; //页数记录
        pageSize = p.pageSize;// 每页要显示的记录数
        totalNum = p.recordCount; // 总记录数
        totalPage = p.pageCount;//总页数
        ////通过总个数获取总页数
        //if (totalNum % pageSize == 0)
        //    totalPage = totalNum / pageSize;
        //else
        //    totalPage = totalNum / pageSize + 1;
        ////页数的边界控制
        //if (page < 1)
        //    page = 1;
        //if (page > totalPage)
        //    page = totalPage;
        
        var sb = "";
        sb = sb +("<div class=\"dataTables_info\" id=\"DataTables_Table_0_info\" role=\"status\" aria-live=\"polite\">");
        sb = sb +("第 ") +(page)  +(" 页|每页 ")  +(pageSize) +(" 条记录|共 ") +(totalNum) +(" 条记录");
        sb = sb +("</div> ");
        sb = sb +("<div class=\"dataTables_paginate paging_simple_numbers\" id=\"DataTables_Table_0_paginate\">");
        sb = sb +("<ul class=\"pagination\">");
        if(page > 1) {
            sb = sb +("<li class=\"paginate_button previous disabled\" aria-controls=\"DataTables_Table_0\" tabindex=\"0\" id=\"DataTables_Table_0_previous\">" +
                "<a href=\"javascript:goPage(") +(page - 1) +(")\">上一页</a></li>");
        }
        var j = totalPage > 10?10:totalPage;
        for(var i = 0;i < j;i++){
            sb = sb +("<li class=\"paginate_button ")  +(page == (i+1)?"active":"") +("\" aria-controls=\"DataTables_Table_0\" tabindex=\"0\"><a href=\"javascript:goPage(")+(i+1) +(")\">")  +(i + 1)  +("</a></li>");
        }
        if(page > 10){
            j = totalPage > 10?10:totalPage;
        }
        if(page < totalPage){
            sb = sb +("<li class=\"paginate_button next\" aria-controls=\"DataTables_Table_0\" tabindex=\"0\" id=\"DataTables_Table_0_next\">" +
                "<a href=\"javascript:goPage(") +(page + 1) +(")\">下一页</a></li>");
        }
        sb = sb +("</ul>");
        sb = sb +("</div> ");
        sb = sb +("<script type=\"text/javascript\">function goPage(p){");
        //sb = sb + "$(\"#"+form+"\").after('<input type=\"hidden\" form=\""+form+"\" name=\"pageNumber\" value=\""+p+"\"><input type=\"text\" form=\""+form+"\" name=\"pageSize\" value=\""+pageSize+"\">');";
        sb = sb + callback + ("(p,"+pageSize+");");
        sb = sb +("}</script>");
        return sb;
    }
};