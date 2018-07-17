<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="utf-8">
	<head>
	
	<style type="text/css">   
#top{postion:absolute;z-index:999;}
*{ margin:0px; padding:0px;}
#nav{}
#nav ul{ list-style:none;}
#nav ul li{ float:left; line-height:40px; text-align:center; position:relative;}
#nav ul li ul{ position:absolute; display:none;}
#nav ul li:hover ul{ display:block}
</style> 
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<title>IT在线学习平台</title>
		
		<link href="res/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="res/css/reset.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="res/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="res/js/bootstrap.min.js"></script>
		
		<!--[if lt IE 9]>
		  <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		<link rel="icon" type="image/png" href="res/i/ico.png" sizes="16x16">
		<script type="text/javascript">
		CONETXT_PATH = '';
		</script>
	<script type="text/javascript">
	//
    function validate()
    {
    var psw=document.getElementById("psw").value;
    var opsw=document.getElementById("opsw").value;
    var mima1=document.getElementById("npsw").value;
    var mima2=document.getElementById("npsw2").value;
    if(mima1==""||opsw==""||mima2==""){
    alert("密码不能为空");
    document.getElementById("opsw").focus();
    return false;
    }
    else if(opsw!=psw)
    {
    	alert("原始密码错误");
        document.getElementById("opsw").focus();
        return false;            
    }
    else if(mima1!=mima2)
    {
    alert("请确认密码一致");
    document.getElementById("npsw").focus();
    return false;
    }
    else
    {
    alert("修改密码成功");
    return true;
    }
    }                        //check password infomation--YC
    
    
    
    $("#btn1").click(function(){
		$("#btn1").toggle();
	});
    </script>
 
 <script>
	function setImagePreview() {
		var docObj = document.getElementById("doc");
		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
		
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '68px';
			imgObjPreview.style.height = '50px';
			imgObjPreview.style.position = "absolute";
			imgObjPreview.style.left="997px";
			imgObjPreview.style.top="20px";
			//imgObjPreview.src = docObj.files[0].getAsDataURL();
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag");
			//必须设置初始大小
			localImagId.style.width = "68px";
			localImagId.style.height = "50px";
			localImagId.style.position = "absolute";
			localImagId.style.left="1350px";
			localImagId.style.top="20px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
</script>
 
 
 
 
 
 
 
	</head>

	<body>
	<%String id = session.getAttribute("Id").toString();;//request.getAttribute("Id").toString();%>
	<%String name = session.getAttribute("name").toString();%>
	<%String email = session.getAttribute("email").toString();%>
	<%String tel = session.getAttribute("tel").toString();%>
	<%String sex = session.getAttribute("sex").toString();%>
	<%String des = session.getAttribute("des").toString();%>
	<%String psw = session.getAttribute("psw").toString();%>
		<!-- 头部-start -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"  style="position:fixed; top:30%;">
		    <div class="modal-dialog" role="document">
		        <div class="modal-content">
		        
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true" style="font-size:18px;">×</span>
		                </button>
		                <h4 class="modal-title"  id="loginTitle"  style="float: left; color: #337Ab7;cursor: pointer; " onclick="login();">个人信息</h4>
		                <h4 class="modal-title"  id="registeTitle"  style="float: left;margin-left: 20px;cursor: pointer;" onclick="registe();">修改密码</h4>
		                <div class="clearfix"></div>
		            </div>
		            <!-- modify information -->>
		            <div class="modal-body">
		               	<form action="${pageContext.request.contextPath}/ModifyInfo" method="post" id="loginForm" class="form-horizontal" style="padding: 0px 20px;">
		               	<div class="form-group">
		                          account:<%=id%><input type="hidden" name="id" value=<%=id%>>
		                      </div>
		               	<div class="form-group">
		                          name:<input name="name" type="text" class="form-control"  id="username"  value=<%=name%>>
		                      </div>
		                      <div class="form-group help">
		                          sex：<h4><select id="sex" name="sex" >  
    <option id="male" value="male" >male</option>  
    <option id="female" value="female">female</option> 
</select>  </h4>
		                      </div>
		                      <div class="form-group">
		                          tel:<input name="tel" type="text" class="form-control"  id="username"  placeholder="tel" value=<%=tel%>>
		                      </div>
		                      <div class="form-group help">
		                          email:<input name="email" type="text" class="form-control"  id="password"  placeholder="email" value=<%=email%>>
		                      </div>
		                      <div class="form-group help">
		                          person description:<input name="des" type="text" class="form-control"  id="password"  placeholder="des" value=<%=des%>>
		                      </div>
		                      

		                      
		                      <a href="javascript:void(0)">
		                      	<input type="submit" value="保存" />
		                      </a>
		                  </form>
		                  <!-- modify password -->
<form action="${pageContext.request.contextPath}/ModifyPsw" method="post" onSubmit="return validate()" id="registeForm" class="form-horizontal" style="padding: 0px 20px;display: none;">
<input type="hidden" name="methodName" value="0"/>
 <input type="hidden" name="id" value=<%=id%>>
  <input type="hidden" name="psw" id="psw" value=<%=psw%>>
 <input type="hidden" name="name" value=<%=name%>>
 <input type="hidden" name="sex" id="sex1" value=<%=sex%>>
 <input type="hidden" name="tel" value=<%=tel%>>
 <input type="hidden" name="email" value=<%=email%>>
 <input type="hidden" name="des" value=<%=des%>>   
<h4>  原始密码:<input type="password" name="opsw" id="opsw"></input><br></h4>
<h4>  新密码：<input type="password" name="npsw" id="npsw"></input><br></h4>
<h4>  确认新密码：<input type="password" name="npsw2" id="npsw2"></input><br></h4>

 <input type="submit" value="提交"/>
 
  </form>
		                  
		            </div>
					
		        </div>
		    </div>
		</div>
		<div class="f-header" id="top">
			<div class="f-header-box clearfix">
				<a href=".."  class="logo" title="IT在线学习平台"></a>
				<nav class="header-nav">
					<a href="success.html" class="header-nav-item">首 页</a>
					<a href="list.html" class="header-nav-item">课 程</a>									
					<a href="stCourse.jsp" class="header-nav-item">我的课堂</a>
					<form class="header-nav-item" action="${pageContext.request.contextPath}/joinServlet"  method="post">					
					<input type="text" name="cid" name="cid" >
					<input type="submit" value="加入课堂" style="position: absolute; left: 770px; top: 30px; border-radius: 3px;">
					<input type="hidden" name="id" value=<%=id%>>
					</form>
					
				</nav>
				
				<nav class="header-nav" style="float:right" >
				
					<div id="nav" >
						<ul>      
       					    <li><a href="#">Welcome,<%=name%> </a>
            			       <ul>      
                		            <li><a href="#myModal" data-toggle="modal" onclick="login();">我的信息</a></li>   
                		                              		    
            			       </ul>
            			    <li><a href="index.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退出</a></li>            
       				   	</ul>
					</div>
				</nav>
				
				
				<nav class="header-nav" style="float: right">
			  <button onclick=$("[type=file]").click()  id="btn1"  style="position:absolute;border:none;left:937px; top:40px;">我的头像</button>
				<div id="nav" class="am-form-file">
					<input style="display: none;" type=file name="doc" id="doc" onchange="javascript:setImagePreview();">
					
					
						<img id="preview" width=-1 height=-1 style="display:none;"/>
					
					
				</div>
			</nav>
				
				
				
				
				
			</div>
		</div>
		
		<script type="text/javascript">
		
			function login(){
				$('#loginTitle').css('color','#337Ab7');
				$('#loginForm').show();
				$('#registeTitle').css('color','#000');
				$('#registeForm').hide();
				var sex=document.getElementById("sex1").value;
				if(sex=="female")
					{
					document.getElementById("female").selected=true;
					}
				
			}
			function registe(){
				$('#loginTitle').css('color','#000');
				$('#loginForm').hide();
				$('#registeTitle').css('color','#337Ab7');
				$('#registeForm').show();
			}
			$(function(){
				$("#userdetail").popover({
		            trigger:'manual',
		            placement : 'bottom',
		            html: 'true',
		            content : '<div style="width:300px;height:300px;"></div>',
		            animation: false
		        }).on("mouseenter", function () {
		            var _this = this;
		            $(this).popover("show");
		            $(this).siblings(".popover").on("mouseleave", function () {
		                $(_this).popover('hide');
		            });
		        }).on("mouseleave", function () {
		            var _this = this;
		            setTimeout(function () {
		                if (!$(".popover:hover").length) {
		                    $(_this).popover("hide")
		                }
		            }, 0);
		        });
				//课程分类展示 
				$(".category").popover({
		            trigger:'manual',
		            placement : 'right',
		            html: 'true',
		            content : '',
		            animation: false
		        }).on("mouseenter", function () {
		            var cid = $(this).attr('c-id');
		            $('#' + cid).show();
		            $('#' + cid).hover(function(){
		            	$('#' + cid).show();
		            },function(){
		            	$('#' + cid).hide();
					});
		        }).on("mouseleave", function () {
		            var cid = $(this).attr('c-id');
		            $('#' + cid).hide();
		        });
			});
		</script>
		<!-- 头部-end -->
		
		<!-- 登录注册-start -->
		
		<!-- 登录注册-end -->
		
		<div class="f-main">
			<!-- 轮播 分类-start -->
			<div class="clearfix">
				<div class=main-category>
					<div class="main-bg">
						<div class="main-bg-item " style="background-image: url('res/i/c1.jpg'); ">
							<div class="main-title-1"></div>
						</div>
		
						<div class="main-bg-item " style="background-image: url('res/i/c2.jpg'); ">
							<div class="main-title-2"></div>
						</div>
		
						<div class="main-bg-item " style="background-image: url('res/i/c3.jpg'); ">
							<div class="main-title-3"></div>
						</div>
					</div>
		
					<div class="f-nav-box">
						<div class="bg-nav">
							<a class="cur"></a> <a></a> <a></a>
						</div>
					</div>
					
					<div class="main-category-menu">
						<div class="category" c-id="a">
							<a><div class="group">数据开发 </div></a>
						</div>
						
						<div class="category" c-id="b">
							<a><div class="group">移动开发</div></a>
						</div>
						
						<div class="category" c-id="c">
							<a><div class="group">后端开发</div></a>
						</div>
						
						<div class="category" c-id="d">
							<a><div class="group">数据库</div></a>
						</div>
						
						<div class="category" c-id="e">
							<a><div class="group">运维&测试</div></a>
						</div>
						
						<div class="category" c-id="f">
							<a><div class="group">UI设计</div></a>
						</div>
					</div>
										
					<div class="main-category-submenu-content"  id="a" >
						AAAAAAAAAA
					</div>
					
					<div class="main-category-submenu-content"  id="b" >
						BBBBBBBBBBBB
					</div>
					
					<div class="main-category-submenu-content"  id="c" >
						CCCCCCCCCCCC
					</div>
					
					<div class="main-category-submenu-content"  id="d" >
						DDDDDDDDDDDDDD
					</div>
					
					<div class="main-category-submenu-content"  id="e" >
						EEEEEEEEE
					</div>
					
					<div class="main-category-submenu-content"  id="f" >
						FFFFFFFFFF
					</div>
					
				</div>
			</div>
			<!-- 轮播 分类-end -->
			
			<!-- 实战推荐-start -->
			<div class="types-block clearfix">
				<h3 class="types-title">实战推荐</h3>
				<div class="types-content">
					
					<a href="video.jsp">
					<div class="course-card-container">
						<div class="course-card-top green-bg">
							<span>测试</span>
						</div>

						<div class="course-card-content">
							<h3 class="course-card-name">Android自动化测试实战 工具 框架 脚本</h3>
							<p title="找Android自动化测试工作必学的主流工具、框架和自动化脚本">找Android自动化测试工作必学的主流工具、框架和自动化脚本</p>
							<div class="course-card-bottom">
								<div class="course-card-info">178人在学</div>
								
							</div>
						</div>
					</div>
					</a>

					<a href="learn.html">
					<div class="course-card-container">
						<div class="course-card-top pink-bg">
							<span>WebApp</span>
						</div>
						<div class="course-card-content">
							<h3 class="course-card-name">AngularJS仿拉勾网WebApp 开发移动端单页应用</h3>
							<p title="基于AngularJS，仿拉勾网开发一个招聘类的移动端单页应用">基于AngularJS，仿拉勾网开发一个招聘类的移动端单页应用</p>
							<div class="clearfix course-card-bottom">
								<div class="course-card-info">344人在学</div>
	
								
							</div>
						</div>
					</div>
					</a>
					
					<a href="learn.html">
					<div class="course-card-container">
						<div class="course-card-top brown-bg">
							<span>Django</span>
						</div>
	
						<div class="course-card-content">
							<h3 class="course-card-name">强力django杀手级xadmin 打造上线标准的在线教育平台</h3>
							<p title="全面掌握django框架,轻松应对python web开发工作">全面掌握django框架,轻松应对python web开发工作</p>
							<div class="clearfix course-card-bottom">
								<div class="course-card-info">488人在学</div>
							
							</div>
						</div>
					</div>
					</a>
	
					<a href="learn.html">
					<div class="course-card-container">
						<div class="course-card-top purple-bg">
							<span>Python</span>
						</div>
	
						<div class="course-card-content">
							<h3 class="course-card-name">Python高级编程技巧实战</h3>
							<p title="精选50个python训练任务，提升实战技能与高效编程技巧">精选50个python训练任务，提升实战技能与高效编程技巧</p>
							<div class="clearfix course-card-bottom">
								<div class="course-card-info">813人在学</div>
							
							</div>
						</div>
					</div>
					</a>
					
					<a href="learn.html">
					<div class="course-card-container" style="margin-right: 0px;">
						<div class="course-card-top green-bg">
							<span>PHP</span>
						</div>
						
						<div class="course-card-content">
							<h3 class="course-card-name">前端后台ThinkPHP开发整站</h3>
							<p title="用PHP+MySQL+Ajax开完新闻资讯整站，实现“小全栈”的梦想">用PHP+MySQL+Ajax开完新闻资讯整站，实现“小全栈”的梦想</p>
							<div class="clearfix course-card-bottom">
								<div class="course-card-info">2324人在学</div>
							
							</div>
						</div>
					</div>
					</a>
					
				</div>
			</div>
			<!-- 实战推荐-end -->
			
			
			<!-- java课程-start -->
			<div class="types-block clearfix">
				<h3 class="types-title">Java开发工程师</h3>
				<div class="types-content-left "
					style="background-image: url(http://img.mukewang.com/58ac18fd00012a4202240348.jpg);">
					<div class="course-card-container-fix">
						<div class="course-card-content">
							<h3 class="course-card-name">Java职业路径</h3>
							<p class="color-fff" title="带你研究Java技术框架">带你研究Java技术框架，系统地学习java技术</p>
							<div class="course-card-bottom" style="margin-top: 50px;">
								<div class="course-card-info color-fff">了解详情 →</div>
							</div>
						</div>
					</div>
				</div>
	
				<div class="types-content-right ">
					<div class="types-content-banner ">
						<a target="_blank" href="http://coding.imooc.com/class/81.html">
							<div class="types-content-banner-block green-bg"  style="margin-right:20px;" >
								Spring框架实战讲解！
							</div>
						</a>
						<a target="_blank" href="http://coding.imooc.com/class/76.html">
							<div class="types-content-banner-block gray-bg"  >
								MyBatis框架实战讲解！
							</div>
						</a>
					</div>
					
					<div class="clearfix">
						<a href="learn.html">
							<div class="course-card-container">
								<div class="course-card-top green-bg">
									<span>测试</span>
								</div>
	
								<div class="course-card-content">
									<h3 class="course-card-name">Android自动化测试实战 工具 框架 脚本</h3>
									<p title="找Android自动化测试工作必学的主流工具、框架和自动化脚本">找Android自动化测试工作必学的主流工具、框架和自动化脚本</p>
									<div class="course-card-bottom">
										<div class="course-card-info">
											初级<span>·</span>178人在学
										</div>
									</div>
								</div>
							</div>
						</a> 
						
						<a href="learn.html">
							<div class="course-card-container">
								<div class="course-card-top pink-bg">
									<span>WebApp</span>
								</div>
								<div class="course-card-content">
									<h3 class="course-card-name">AngularJS仿拉勾网WebApp 开发移动端单页应用</h3>
									<p title="基于AngularJS，仿拉勾网开发一个招聘类的移动端单页应用">基于AngularJS，仿拉勾网开发一个招聘类的移动端单页应用</p>
									<div class="clearfix course-card-bottom">
										<div class="course-card-info">
											初级<span>·</span>3444人在学
										</div>
									</div>
								</div>
							</div>
						</a>
		<a href="learn.html">
						<div class="course-card-container">
							<div class="course-card-top brown-bg">
								<span>Django</span>
							</div>
	
							<div class="course-card-content">
								<h3 class="course-card-name">强力django杀手级xadmin 打造上线标准的在线教育平台</h3>
								<p title="全面掌握django框架,轻松应对python web开发工作">全面掌握django框架,轻松应对python
									web开发工作</p>
								<div class="clearfix course-card-bottom">
									<div class="course-card-info">
										初级<span>·</span>4888人在学
									</div>
								</div>
							</div>
						</div>
	
	      </a>
	      <a href="learn.html">
						<div class="course-card-container" style="margin-right: 0px;">
							<div class="course-card-top purple-bg">
								<span>Python</span>
							</div>
	
							<div class="course-card-content">
								<h3 class="course-card-name">Python高级编程技巧实战</h3>
								<p title="精选50个python训练任务，提升实战技能与高效编程技巧">精选50个python训练任务，提升实战技能与高效编程技巧</p>
								<div class="clearfix course-card-bottom">
									<div class="course-card-info">
										高级<span>·</span>81333人在学
									</div>
								</div>
							</div>
						</div>
				 </a>
	
					</div>
				</div>
			</div>
			<!-- java课程-end -->
			
			<!--名校讲师-start -->
			<div class="types-block clearfix">
				<h3 class="types-title">名校讲师</h3>
				<a href="teacher.html">
					<div class="lecturer-card-container">
						<div class="lecturer-item">
							<img class="lecturer-uimg" src="res/i/header.jpg">
							<span class="lecturer-name">王阳明</span>
							<span class="lecturer-title">中华大学</span>
							<span class="lecturer-p" >中华大学高级讲师，擅长写代码</span>
						</div>
					</div>
				</a>
					
				<a href="teacher.html">
					<div class="lecturer-card-container">
						<div class="lecturer-item">
							<img class="lecturer-uimg" src="res/i/header.jpg">
							<span class="lecturer-name">王阳明</span>
							<span class="lecturer-title">中华大学</span>
							<span class="lecturer-p" >中华大学高级讲师，擅长写代码</span>
						</div>
					</div>
				</a>
            <a href="teacher.html">
				<div class="lecturer-card-container">
					<div class="lecturer-item">
						<img class="lecturer-uimg" src="res/i/header.jpg">
						<span class="lecturer-name">王阳明</span>
						<span class="lecturer-title">中华大学</span>
						<span class="lecturer-p" >中华大学高级讲师，擅长写代码</span>
					</div>
				</div>
				</a>

            <a href="teacher.html">
				<div class="lecturer-card-container"  >
					<div class="lecturer-item">
						<img class="lecturer-uimg" src="res/i/header.jpg">
						<span class="lecturer-name">王阳明</span>
						<span class="lecturer-title">中华大学</span>
						<span class="lecturer-p" >中华大学高级讲师，擅长写代码</span>
					</div>
				</div>
				</a>
				
				<a href="teacher.html">
				<div class="lecturer-card-container" style="margin-right: 0px;">
					<div class="lecturer-item">
						<img class="lecturer-uimg" src="res/i/header.jpg">
						<span class="lecturer-name">王阳明</span>
						<span class="lecturer-title">中华大学</span>
						<span class="lecturer-p" >中华大学高级讲师，擅长写代码</span>
					</div>
				</div>
				</a>
					
			</div>
			<!--名校讲师-end -->
		</div>
		
		
		<!-- 页脚-start -->
		<div class="f-footer">
			<div class="f-footer-box clearfix">
				<div class="footer-link">
					<a href="javascript:void(0);"  target="_blank" title="企业合作">企业合作</a> 
					<a href="javascript:void(0);" target="_blank" title="联系我们">联系我们</a> 
					<a href="javascript:void(0);" target="_blank" title="常见问题">常见问题</a> 
					<a href="javascript:void(0);" target="_blank" title="意见反馈">意见反馈</a>
					<a href="javascript:void(0);" target="_blank" title="友情链接">友情链接</a>
				</div>
				<div class="footer-copyright">
					<span>©&nbsp;2017&nbsp; 备案 </span>
				</div>
			</div>
		</div>
		<!-- 页脚-end-->
		
	</body>
	
	<script>
	$(function(){
		var index = 0;
		var timer = 4000;
		$('.bg-nav a').click(function(){
			index = $('.bg-nav a').index($(this));
			rollBg(index);
		});
		$('.index-roll-item').click(function(){
			index = $('.index-roll-item').index($(this));
			rollBg(index);
		});
		var rollBg = function(i){
			$('.main-bg-item').fadeOut(1000);
			$($('.main-bg-item')[i]).fadeIn(1000);
			$('.bg-nav a').removeClass('cur');
			$($('.bg-nav a')[i]).addClass('cur');
			$('.index-roll-item').removeClass('cur');
			$($('.index-roll-item')[i]).addClass('cur');
		}
		setInterval(function(){
			index += 1;
			index = index%3;
			rollBg(index);
		}, timer);
		
	});
	</script>
</html>
