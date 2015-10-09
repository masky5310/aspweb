
<!--#include file="db/conn.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<Title>宁波融智企业管理咨询有限公司</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
	<!--<META http-equiv="X-UA-Compatible" content="IE=EmulateIE7">-->
  <meta name="keywords" content="宁波融智企业管理咨询有限公司--[浙江省优秀管理咨询机构 企业医院]">
  <meta name="description" content="宁波融智企业管理咨询有限公司--[浙江省优秀管理咨询机构 企业医院]">
  <META NAME="copyright" CONTENT="宁波融智企业管理咨询有限公司--[浙江省优秀管理咨询机构 企业医院]"> 
  <meta name="author" content="rongzhi,lyn.ma@hotmail.com,mochan2586@yahoo.com.cn">
  <meta name="robots" content="all">
  <meta http-equiv="Page-Enter" content="blendTrans(Duration=0.5)">
  <meta http-equiv="Page-Exit" content="revealTrans(duration=5.0, transition=20)"> 
  <link rel="stylesheet" type="text/css" href="theme/style.css"/>
  <link rel="stylesheet" type="text/css" href="theme/vtip.css"> 	
  <link rel="stylesheet" type="text/css" href="theme/style/button.css"/>
  <link rel="stylesheet" type="text/css" href="theme/style/icon.css"/> 
	<script language="javascript" src="js/jquery-1.3.2.min.js"></script>
	<script language="javascript" src="js/pico-button.js"></script>
	<script language="javascript" src="js/vtip-min.js"></script>
</HEAD>
<script>
$(document).ready(function() {
 
	//Set Default State of each portfolio piece
	$(".paging").show();
	$(".paging a:first").addClass("active");
		
	//Get size of images, how many there are, then determin the size of the image reel.
	var imageWidth = $(".window").width();
	var imageSum = $(".image_reel img").size();
	var imageReelWidth = imageWidth * imageSum;
	
	//Adjust the image reel to its new size
	$(".image_reel").css({'width' : imageReelWidth});
	
	//Paging + Slider Function
	rotate = function(){	
		var triggerID = $active.attr("rel") - 1; //Get number of times to slide
		var image_reelPosition = triggerID * imageWidth; //Determines the distance the image reel needs to slide
 
		$(".paging a").removeClass('active'); //Remove all active class
		$active.addClass('active'); //Add active class (the $active is declared in the rotateSwitch function)
		
		//Slider Animation
		$(".image_reel").animate({ 
			left: -image_reelPosition
		}, 500 );
		
	}; 
	
	//Rotation + Timing Event
	rotateSwitch = function(){		
		play = setInterval(function(){ //Set timer - this will repeat itself every 3 seconds
			$active = $('.paging a.active').next();
			if ( $active.length === 0) { //If paging reaches the end...
				$active = $('.paging a:first'); //go back to first
			}
			rotate(); //Trigger the paging and slider function
		}, 7000); //Timer speed in milliseconds (3 seconds)
	};
	
	rotateSwitch(); //Run function on launch
	
	//On Hover
	$(".image_reel a").hover(function() {
		clearInterval(play); //Stop the rotation
	}, function() {
		rotateSwitch(); //Resume rotation
	});	
	
	//On Click
	$(".paging a").click(function() {	
		$active = $(this); //Activate the clicked paging
		//Reset Timer
		clearInterval(play); //Stop the rotation
		rotate(); //Trigger rotation immediately
		rotateSwitch(); // Resume rotation
		return false; //Prevent browser jump to link anchor
	});	
	
});
</script>
<script type="text/javascript">
    <!--
            function changeNews(obj)
            {
                if(obj=="div_news_one")
                {
                    document.getElementById("div_news_one").style.backgroundImage="url(theme/img/newTitleBg01.jpg)";
                    document.getElementById("div_news_two").style.backgroundImage="url(theme/img/newTitleBg02.jpg)";
                    document.getElementById("div_news_one").style.color ="#ffffff";
                    document.getElementById("div_news_one").style.fontWeight="bolder";
                    document.getElementById("div_news_two").style.color ="#333333";
                    document.getElementById("div_news_two").style.fontWeight="normal";
                    document.getElementById("tb_News_one").style.display="block";
                    document.getElementById("tb_News_two").style.display="none";
											 document.getElementById("tbody_News_one").style.display="block";
                    document.getElementById("tbody_News_two").style.display="none";							  
                }
                else
                {
                    document.getElementById("div_news_one").style.backgroundImage="url(theme/img/newTitleBg02.jpg)";
                    document.getElementById("div_news_two").style.backgroundImage="url(theme/img/newTitleBg01.jpg)";
                    document.getElementById("div_news_one").style.color ="#333333";
                    document.getElementById("div_news_one").style.fontWeight="normal";
                    document.getElementById("div_news_two").style.color ="#ffffff";
                    document.getElementById("div_news_two").style.fontWeight="bolder";
                    document.getElementById("tb_News_one").style.display="none";
                    document.getElementById("tb_News_two").style.display="block";
										   document.getElementById("tbody_News_one").style.display="none";
                    document.getElementById("tbody_News_two").style.display="block";	
						          //document.getElementById("tb_News_one").style.width="100%";
									     //document.getElementById("tb_News_two").style.width="100%";
                }
            }
            
            function showSub(obj,subobj)
            {
                document.getElementById(subobj).style.display="block";
                //obj.style.backgroundColor="#f2f2f2";   
            }
            function haddenSub(obj,subobj)
            {
                document.getElementById(subobj).style.display="none";
                //obj.style.backgroundColor="";   
            }
    -->
    </script>
<body>
<div id="web_content">
<div class="head">
	<div class="head_left"><img src="theme/img/logo.gif"   /></div>
		<div class="head_right">
			<span onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.roonzi.com');"  style="cursor: hand;">设为首页</span><br />
			<span><a  href="#" onClick="window.external.addFavorite('http://www.roonzi.com','宁波融智企业管理咨询有限公司')" title="把“宁波融智企业管理咨询有限公司”加入您的收藏夹" >收藏本站</a></span>			
		</div>	
</div>
<div class="menu">				
						<ul id="navList">
							<li><a href="index.asp"  class="vtip_li">首 页</a></li>
							<li><a href="about.asp"   class="vtip_li">公司简介</a></li>
							<li><a href="news.asp"  class="vtip_li">新闻中心</a></li>
							<li><a href="biz.asp"   class="vtip_li">业务范围</a></li>
							<li width="150px"><a href="issue.asp" id="issue" class="vtip_li">企业常见问题与解决方案</a></li>
							<li><a href="case.asp"  class="vtip_li">成功案例</a></li>
							<li><a href="feedback.asp"  class="vtip_li">留言反馈</a></li>						
							<li><a href="contact.asp"  class="vtip_li" id="last">联系我们</a></li>
						</ul>
</div>
<div class="container">	
    <!--<div class="folio_block">	-->
        <div class="main_view">
            <div class="window">	
                <div class="image_reel">
                    <a href="#"><img src="theme/img/2.gif" alt="" width="950" height="186"  border="0"/></a>
                    <a href="#"><img src="theme/img/2.gif" alt="" width="950" height="186"  border="0"/></a>
                    <a href="#"><img src="theme/img/2.jpg" alt="" width="950" height="186"  border="0"/></a>
                    <a href="#"><img src="theme/img/2.gif" alt="" width="950" height="186"  border="0"/></a>
                </div>
            </div>
            <div class="paging">
                <a href="#" rel="1">1</a>
                <a href="#" rel="2">2</a>
                <a href="#" rel="3">3</a>
                <a href="#" rel="4">4</a>
            </div>
        </div>
    <!--</div>-->
</div>

