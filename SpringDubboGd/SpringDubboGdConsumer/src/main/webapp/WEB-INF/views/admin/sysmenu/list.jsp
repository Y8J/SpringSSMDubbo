<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>

<link href="/res/admin/ver2013/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="/res/admin/ver2013/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="/res/admin/ver2013/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="/res/admin/ver2013/css/pony.tree.css" rel="stylesheet" type="text/css"/>

<script src="/res/admin/ver2013/commonjs/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="/res/admin/ver2013/commonjs/jquery.validate.js" type="text/javascript"></script>
<script src="/res/admin/ver2013/commonjs/jquery.metadata.js" type="text/javascript"></script>



<style type="text/css">  
.a_sclist{
width: 16px;
padding-left: 20px;
height: 16px;
}
.span_shut{
cursor: pointer;
background: url(/res/admin/ver2013/images/admin/allbgs.gif) no-repeat -14px -2px;
width: 16px;
padding-left: 20px;
height: 16px;
}
.span_open{
cursor: pointer;
background: url(/res/admin/ver2013/images/admin/allbgs.gif) no-repeat -2px 0px;
width: 16px;
padding-left: 20px;
height: 16px;
}
</style>
<script type="text/javascript">
function getTableForm() {
	return document.getElementById('tableForm');
}
function optDelete() {
	if(Pn.checkedCount('ids')<=0) {
		alert("<@s.m 'error.checkRecord'/>");
		return;
	}
	if(!confirm("<@s.m 'global.confirm.delete'/>")) {
		return;
	}
	var f = getTableForm();
	f.action="o_delete.do";
	f.submit();
}
function optSaveOrder() {
	var f = getTableForm();
	f.action="o_change_sort.do";
	f.submit();
}
$(document).ready(function(){
	$(".pn-ltable .pn-ltbody tr span.a_sclist").each(function(index){
		if($(".pn-ltable .pn-ltbody tr[data-id="+$(this).attr("data-id")+"]").length==0){
			$(this).removeClass("span_shut").removeClass("span_open");
		}else{
			$(this).click(function(){
				if($(this).attr("class").indexOf("span_open")!=-1){
					close_clird($(this));
				}else{
					open_clird($(this));
				}
			});
		}
	});
});
function open_clird(_jDom){
	var _rows=$(".pn-ltable .pn-ltbody tr[data-id="+_jDom.attr("data-id")+"]");
	_rows.each(function(index){
		$(_rows.get(index)).attr("style","");
	});
	_jDom.removeClass("span_shut").addClass("span_open");
}
function close_clird(_jDom){
	var _rows=$(".pn-ltable .pn-ltbody tr[data-id="+_jDom.attr("data-id")+"]");
	_rows.each(function(index){
		var _cur_row=$(_rows.get(index));
		_cur_row.css("display","none");
		recursion_close(_cur_row);
	});
	_jDom.removeClass("span_open").addClass("span_shut");
}
//递归隐藏菜单所有子节点
function recursion_close(_row){
	var _span=_row.find(".span_open");
	if(_span.length!=0){
		_span.each(function(index){
			var _cur_span=$(_span.get(index));
			_cur_span.removeClass("span_open").addClass("span_shut");
			var _rows=$(".pn-ltable .pn-ltbody tr[data-id="+_cur_span.attr("data-id")+"]");
			_rows.each(function(index){
				var _cur_row=$(_rows.get(index));
				_cur_row.css("display","none");
				recursion_close(_cur_row);
			});
		});
	}
}
</script>
</head>
<body>
<div class="body-box">
<div class="rhead">
<div class="box-positon">
	<form class="ropt">
	</form>
	<div class="clear"></div>
</div>
</div>
<form id="tableForm" method="post">
<table class="pn-ltable" width="100%" cellspacing="1" cellpadding="0" border="0">
	<thead class="pn-lthead"><tr>
	<!-- <th width="20"><input type="checkbox" onclick="Pn.checkbox(&quot;ids&quot;,this.checked)"></th> -->
	<th>排序</th>
	<th style="padding-left:60px">菜单名称</th>
	<th>菜单路径</th>
	<th>可视状态</th>
	<th>录入时间</th>
	<th>操作选项</th></tr></thead>
	<tbody class="pn-ltbody">
	
    
    <c:forEach var="menu" items="${mlist}" >  
    <tr style="<#if menu.deep gt 3>display:none;</#if>" data-id="${menu.parentId}">  
	<!--<td><input type="checkbox" name="ids" value="${menu.id}"></td> -->
	<td align="center"><input type="text" name="priority" value="${menu.sortNum}" style="width:30px"></td>
	<td style="padding-left:20px"><span class="a_sclist <#if menu.deep gt 2>span_shut<#else>span_open</#if>" data-id="${menu.id}"></span><a href="v_edit.do?id=${menu.id}">${menu.menuName}</a><input type="hidden" name="wids" value="${menu.id}"></td>
	<td align="center">${menu.menuName}</td>
	<td align="center">${menu.menuUrl}</td>
	<td align="center">${menu.isDel}</td>
	<td align="center">${menu.createTime}</td>
	<td align="center"><a href="v_add.do?parentId=${menu.id}">添加子级菜单</a> | <a href="v_edit.do?id=${menu.id}">修改</a> | <a href="o_delete.do?ids=${menu.id}" onclick="if(!confirm('您确定删除吗？')) {return false;}">删除</a></td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>
<div>
</div>
</form>
</div>

</body>
</html>