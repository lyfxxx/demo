<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <!-- 可选的Bootstrap主题文件（一般不使用） -->
   
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport"
          content="width=device-width,  height=device-height, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no,email=no" />
    <meta name="apple-client-web-app-capable" content="yes" />
    <meta name="apple-client-web-app-status-bar-style" content="default" />
    <title>销售数据统计</title>
    <link rel="stylesheet" href="client/css/style.css">


    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
 
    <script type="text/javascript" src="client/js/jquery-1.11.js"></script>
     <script type="text/javascript" src="client/js/bootstrap.min.js"></script>
     <link href="client/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="client/js/component.tab.js"></script>
    <script type="text/javascript" src="client/js/component.dialog.js"></script>
    <script type="text/javascript" src="client/js/fortest.js"></script>
    <style type="text/css">
        .address_box {
            text-align: center;
        }

      

        * {
            margin: 0px;
            padding: 0px;
            border: none;
            outline: none;
            font-style: normal;
        }


        <!-- 设置表格中每列的长度 -->
    

        .address_box.def:before {
            content: "默认";
            float: left;
            line-height: 1.8rem;
            height: 1.8rem;
            margin-right: .5rem;
            display: inline-block;
            background-color: #46C9D8;
            color: #fff;
            border-radius: .4rem;
            padding: 0 1rem;
            margin-top: .6rem;
            font-size: 1.1rem;
        }

        .tool_title {
            line-height: 5rem;
            height: 5rem;
            background-color: #fff;
            padding-left: 2rem;
            border-bottom: solid 1px #f2f2f2;
        }

        .tt_label {
            color: #999;
            font-size: 1.5rem;
        }

        .select_informationa li.selected {
            background-color: #f2f2f2;
        }

        .select_informationa li.selected .address_box_edit {
            display: block;
        }

        .address_box_edit {
            text-align: center;
            background-color: #f2f2f2;
            border-top: solid 1px #ddd;
            margin-top: 1rem;
            display: none;
        }

        .address_box_edit a {
            line-height: 4rem;
            display: inline-block;
            width: 6rem;
        }


        .select_tools {
            padding-top: 1rem;
            padding-bottom: 1rem;
            text-align: center;
        }

        .element.style {
            border-top: solid 1px #222;
            border-left: solid 1px #222;
            background: #fff;
        }

        .select_informationa {
            background: #fff;
            width:100%;
            height:auto;
        }
        .time {
            width: 100%;
            display: inline-block;
            margin-top: 1rem;
        }

        .time label {
            display: inline-block;
            width: 50%;
            float: left;
            height: 3rem;
            line-height: 3rem;
        }

        .glyphicon {
            position: relative;
            top: 1px;
            display: inline-block;
            font-family: 'Glyphicons Halflings';
            -webkit-font-smoothing: antialiased;
            font-style: normal;
            font-weight: normal;
            line-height: 1;
            -moz-osx-font-smoothing: grayscale;
        }

        table {
            border-top: solid 1px #222;
            border-left: solid 1px #222;
        }
        td {
            width: 5%;
            height: auto;
            border-bottom: solid 1px #222;
            border-right: solid 1px #222;
            text-align: center;
        }

     button{
         background-color: #fff;

     }
       .box1{
           margin: 0 auto;
       }
        .wrapper{

        }
        .img_label{
        width:20%;
        height:auto;
        }
    
    </style>
</head>
<body>
<div class="wrapper">
    <!-- ↓↓↓主屏↓↓↓ -->
    <div class="page_index">
        <div class="select_tools">
            <!-- 选择默认时间为当月第一天 -->
            <!-- 当日期发生改变,  需要在点击后,根据已经选择的公司来显示数据,  点击-->
            <div class="time">
                <label>起:<input type="date" class="select_start_time" /></label>
                <label>止:<input type="date" class="select_end_time" /></label>
            </div>
            
        </div >
  新客户、新样酒客户数、新成交客户数、总客户数、总样酒客户数、总成交客户数      
        <div class="select_informationa">
           <table>
           <tbody id="tb">
                <tr id="tr1">
                    <td>
                        <div>
                            <div class="box_cell">序号</div>

                            <button class="btn" style="display: none"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>

                            </div>

                    </td>
                    <td>
                        <div>
                           <div>销售</div>
                            
 <button class="btn" style="display: none"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>
                        </div>
                    </td>
                    <td>
                        <div>
                            <div value="total_new_customers">新客户</div>

                            <button class="btn" ng-click="col='name';desc=!desc"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>
                        </div>
                    </td>
                    <td>
                        <div>
                            <div value="total_new_sample">新样酒客户数</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>
                        </div>
                    </td>
                    <td>
                        <div>
                            <div value="total_new_suceess">新成交客户数</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>
                        </div>
                    </td>
                    <td>
                        <div>
                            <div value="total_customers">总客户数</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>
                        </div>
                    </td>
                    <td>
                        <div>
                            <div value="total_sample_customers">总样酒客户数</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>

                        </div>
                    </td>
                    <td>
                        <div>
                            <div value="total_suceess_customers">总成交客户数</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>

                        </div>
                    </td>
                    <td>
                        <div>
                           <div value="total_new_vip">新VIP客户数</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>

                        </div>
                    </td>
                    <td>
                        <div>
                            <div value="total_vip_customers">总VIP客户数</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>

                        </div>
                    </td>
                    <td>
                        <div>
                           <div value="total_lost_customers">客户总流失</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>

                        </div>
                    </td>
                    <td>
                        <div>
                            <div value="grade">业绩</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>

                        </div>
                    </td>
                     <td>
                     <!--新样酒/新客户 新成交/新客户 总样酒/总客户   总成交/总客户 流失客户/总客户 --> 
                        <div>
                            <div value="p_total_sample">新样酒/新客户</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>

                        </div>
                    </td>
                    <td>
                        <div>
                            <div value="p_new_sample">新成交/新客户</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>

                        </div>
                    </td>
                    <td>
                        <div>
                            <div value = "p_success_c">总样酒/总客户</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>

                        </div>
                    </td>
                    
                    <td>
                        <div>
                            <div value="p_new_success">总成交/总客户</div>

                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>

                        </div>
                    </td>
                    <td>
                        <div>
                            <div value="p_lost_success">流失客户/总成交客户</div>
                            <button class="btn"><span class="glyphicon glyphicon-sort-by-attributes"></span></button>

                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
           
        </div>
    </div>
     
    <!-- ↑↑↑主屏↑↑↑ -->

    <!-- ↓↓↓第二屏↓↓↓ -->
    <div class="page_2rd"></div>
    <!-- ↑↑↑第二屏↑↑↑ -->

    <!-- 会话屏 -->
    <div class="page_dialog">
        <div class="dialog_bg">
            <div class="message_container"></div>
        </div>
    </div>
    <!-- 会话屏 -->
</div>
</body>
<script type="text/javascript"><!--
var json_data =null;



  var ht=[];
    $(document).ready(function() {
   $("table tr:eq(1) td:eq(0)").append("<div>"+"hhhhhh"+"</div>");
   
        //切换图标
        var that= null;//记下以前按钮状态
        $("button").click(function(){
		var hash = {};
		var s_data=[]
		$("#tr1").nextAll().empty();
		var i_index=[]
		var sort_arr=[];
		var html="";
		var attr = $(this).siblings("div").attr("value");
		console.log(attr)
		var re =json_data.records;
       for(var i= 0;i<re.length;i++){
       	var jb =re[i]
      	s_data.push( jb);
		sort_arr.push( jb);
       }
       	 var s_asc =[];
         	if (that != null&&that!=this) {
                if($(that).children("span").hasClass("glyphicon-sort-by-attributes-alt")){
                    $(that).children("span").removeClass("glyphicon-sort-by-attributes-alt");
                }
            }
            if($(this).children("span").hasClass("glyphicon-sort-by-attributes-alt")){
         
            s_asc=s_data.sort(function(a,b){
         		if (a[attr]<b[attr]) {
             	return 1;
	         }else if(a[attr]>b[attr]){
	             return -1
	         }else{
	             return 0;
	         }   
   			})
            
           	$(this).children("span").removeClass("glyphicon-sort-by-attributes-alt");
           }else{
           s_data.sort(function(a,b){
             if (a[attr]>b[attr]) {
             	return 1;
	         }else if(a[attr]<b[attr]){
	             return -1
	         }else{
	             return 0;
	         }    
       });
   	console.log(s_data);
                $(this).children("span").addClass("glyphicon-sort-by-attributes-alt");
     }
            
       var cat=[]
            for(var i=0; i<s_asc.length;i++){
             var value = s_asc[i];
             if(sort_arr.indexOf(value)!=-1){
            	 i_index.push(sort_arr.indexOf(value));
             }
        }
         /*
			console.log(i_index.length);
			for(var i=0;i<i_index.length;i++){
				var num = i_index[i];
				var ini =parseInt(num) 
				$("tbody").append(ht[ini]);
        	}
     */
      $("#tr1").nextAll().empty();
      var json = {"records":s_data};
     initTable(json,"");
       		that= this
 
            
            //正序遍历
                //对选中的对象遍历;获取列索引,得到该对象,按照大小排序,返回行索引,对行排序
                //siblings
        });
        
        //1. 设置2个日期,1个公司选择器的初始值
        var today = new Date();
        var thisMonth = today.getMonth()
        //var _firstday = dd.Format("yyyy-MM-dd");
        var _firstday = new Date(2018,thisMonth,1).Format("yyyy-MM-dd");
        today = new Date().Format("yyyy-MM-dd");
        $(".select_start_time").val(_firstday);
        $(".select_end_time").val(today);

        //2. 根据初始化的条件,ajax获取数据并渲染列表
        loadData(_firstday, today);
        //3. 给日期控件绑定点击事件
        $(".select_start_time").change(function() {
            var start_time = $(this).val();
            var end_time = $(".select_end_time").val();
            loadData(start_time, end_time);
        });
        $(".select_end_time").change(function() {
            var start_time = $(".select_start_time").val();
            var end_time = $(this).val();
            loadData(start_time, end_time);
        });
    });
    //通过方法:ajax获取列表数据
    //参数:开始时间 结束时间 销售资料

     var first_name = "";
       var second_name = "";
         var third_name = "";
    function loadData(start_time, end_time) {
   selectStartDay = start_time;
   selectEndDay = end_time;
     var html = "";
        $.ajax({
            url : "client/sen/salesInfo",
            type : 'post',
            dataType : 'json',
            data : {
                "startDay" : start_time,
                "endDay" : end_time,
            },
            success : function(data) {
                if (data.records != null) {
                    //渲染列表
                  $("#tr1").nextAll().empty();
                  var init_arr = data.records;
                  first_name = init_arr[0].sale_name ;
                  second_name = init_arr[1].sale_name ;
                  third_name = init_arr[2].sale_name ;
                 json_data =  data;
                    initTable(data,html);
                }
            }
        });
    }
   var selectStartDay=""
   var selectEndDay=""
    //数据显示表格
    function initTable(data,html) {
    var count = 0;
        closeDialog();
        var today = new Date();
        var thisMonth = today.getMonth()
        var _firstday = new Date(2018,thisMonth,1).Format("yyyy-MM-dd");
        today = new Date().Format("yyyy-MM-dd");

        var node=""
        //给对应的信息加上标题
        $(data.records).each(
        
       
                function(i, e) {
              
                switch(e.sale_name){
                case first_name :
                 node="<tr><td class=\"ab_id\">" +"<img class='img_label'  src='/client/img/first_saler.png'>"+"</img>"+"</td>"
                break;
                 case second_name :
                  node="<tr><td class=\"ab_id\">" +"<img class='img_label' src='/client/img/second_saler.png'>"+"</img>"+"</td>"
                break;
                 case third_name :
                  node="<tr><td class=\"ab_id\">" +"<img class='img_label' src='/client/img/third_saler.png'>"+"</img>"+"</td>"
                break;
                default:
                  node="<tr><td class=\"ab_id\">" +(i + 1)+"</td>"
                break;
                }
                //?id='"+e.id+"'&start_time='"+_firstday+"'&end_time='"+today+"'\
   //新客户、新样酒客户数、新成交客户数、总客户数、总样酒客户数、总成交客户数      
var s=node +
"<td class=\"ab_sale_name\">" +                   e.sale_name                    + "</td>"+
"<td class=\"ab_total_new_customers\">"+e.total_new_customers+ "</td>"+
"<td class=\"ab_total_new_sample\">" +           e.total_new_sample               + "</td>"+
"<td class=\"ab_total_new_suceess\">" +          e.total_new_suceess                + "</td>"+
"<td class=\"ab_total_customers\">" +            e.total_customers          + "</td>"+

"<td class=\"ab_total_sample_customers\">" +    e.total_sample_customers           + "</td>"+

"<td class=\"ab_total_suceess_customers\">" +   e.total_suceess_customers                 + "</td>"+
"<td class=\"ab_total_new_vip\">" +               e.total_new_vip                       + "</td>"+
"<td class=\"ab_total_vip_customers\">" + e.total_vip_customers+ "</td>"+
"<td class=\"ab_total_lost_customers\">" +"<a href=\"/client/CustomersDetail.jsp?id="+e.id+"&start_time=&end_time=\" type=\"button\" class=\"btn\" operation=\"show\">"+ e.total_lost_customers+"</a>"+ "</td>"+
"<td class=\"ab_grade\">"+"<a href=\"/client/MonthlySalesDetail.jsp?id='"+e.id+"'&start_time='"+selectStartDay+"'&end_time='"+selectEndDay+"'\" type=\"button\" class=\"btn\" operation=\"show\">" + e.grade+"</a>" +"</td>"+
"<td class=\"ab_sample_customer\">" + toPercent(e.total_new_sample/e.total_new_customers)+ "</td>"+
"<td class=\"ab_new_sample_customer\">" + toPercent(e.total_new_suceess/e.total_new_customers)+ "</td>"+
"<td class=\"ab_success_custmer\">" + toPercent(e.total_sample_customers/e.total_customers)+ "</td>"+
"<td class=\"ab_new_success_custmer\">" + toPercent(e.total_suceess_customers/e.total_customers)+ "</td>"+
"<td class=\"ab_lost_success\">" + toPercent(e.total_lost_customers/e.total_suceess_customers)+ "</td>"+
"</tr>";
                    //把html 放入数组
                   
                   html+=s;
                     ht.push(s)
                   
                });
               // console.log(html)
             $("tbody").append(html); 
             //$("tbody tr:eq(1) td(1)").append("<div>"+"jkkljjkln"+"<>");
      
    }
    // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
    // 例子：
    // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
    // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
    Date.prototype.Format = function(fmt) { //author: meizz
        var o = {
            "M+" : this.getMonth() + 1, //月份
            "d+" : this.getDate(), //日
            "h+" : this.getHours(), //小时
            "m+" : this.getMinutes(), //分
            "s+" : this.getSeconds(), //秒
            "q+" : Math.floor((this.getMonth() + 3) / 3), //季度
            "S" : this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
                    .substr(4 - RegExp.$1.length));
        for ( var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
                        : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

    function toPercent (doubleNumber){
        var result = (doubleNumber*100).toFixed(2) + "%";
        return result;
    }

    function searchDetail(salesId,startDay,endDay){
        var text = '';
        if(window.confirm(text)){
            var url="client/sen/detailInfo";
            $.post(url,{sales_id:ids,start_time:startDay,end_time:endDay},function(data){
                refreshPage();
            },"json") ;
        }
    }

--></script>
</html>