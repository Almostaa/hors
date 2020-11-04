<template>
	<div>
		<div id="top" class="top">
		  <div class="wrap">
		      <p class="call">888-888/888888电话预约</p>
		      <p class="welcome">欢迎来到多吃黑芝麻健康服务平台&nbsp;请&nbsp;&nbsp;
		         <a @click="login()" style="cursor:pointer">登录</a>&nbsp;|
		         <a @click="register()" style="cursor:pointer">注册</a>
		      </p>
		  </div>
		</div>
		<div id="header" class="header">
			<!-- 搜索框 -->
		    <div class="wrap">
		        <a href="#" class="logo"><img src="../../assets/images/logo.jpg"></a>
		    </div>
		</div>
		<div id="nav" class="nav">
		    <div class="wrap">
		        <div class="link menu" @click="home()">全部科室</div>
		        <a class="link" @click="problem()">专家问诊</a>
		        <a class="link" @click="news()">健康资讯</a>
		        <a class="link" @click="user()">个人中心</a>
		    </div>
		</div>
		
		<div>
			<div style= "position:relative " class="aaaa"> 
				<div style= "position:absolute; left:200px; top: 350px; color:#000000; font-weight:bold ;z-index: 1;">
					<a href="https://www.91huayi.com/contents/3/25842.html" style="color: #000000;font-size: 20px;">
						国家医保局官宣！医保支付将发生重大改革！</a> 
				</div> 
				<a href="https://www.91huayi.com/contents/3/25842.html"><img :src="img1" /></a> 
			</div>
			<div style= "position:relative " class="aaa">
				<div style= "position:absolute; left:610px; top: 160px; color:#000000; font-weight:bold;z-index: 1; ">
					<a href="https://www.91huayi.com/contents/3/25834.html" style="color: #000000;font-size: 15px;">
						青岛疫情密接者大幅度上升！
					</a> 
				</div> 
				<a href="https://www.91huayi.com/contents/3/25834.html"><img :src="img1" /></a> 
			</div>
			<div style= "position:relative " class="aa">
				<div style= "position:absolute; left:610px; top: 360px; color:#000000; font-weight:bold;z-index: 1; ">
					<a href="https://www.91huayi.com/contents/3/25833.html" style="color: #000000;font-size: 15px;">
						青岛疫情，张文宏最新判断！
					</a> 
				</div> 
				<a href="https://www.91huayi.com/contents/3/25833.html"><img :src="img1" /></a> 
			</div>
			<div style="margin-right: 30px;">
				<div class="new_list_con">
					<h3>
						<span>推荐热点</span>
						<a href="https://www.91huayi.com/news_index.html" style="font-size: 15px;margin-left: 270px;" >
							更多>>
						</a>
					</h3>
					<div>
						<li><a href="">原因并不只有天气9999999999</a><span>2017-12-15</span></li>
						<li><a href="">原因并不只有天气wwwwddxxw</a><span>2017-12-15</span></li>
						<li><a href="">原因并不只有天气wwwwwwwww</a><span>2017-12-15</span></li>
					</div>
				</div>
			</div>
		</div>
		
		<!-- <div id="ttt" class="ttt">
		    <div class="wrap">
		        <div class="link menu">分类</div>
		        <a class="link" @click="problem()">专家问诊</a>
		        <a class="link" @click="news()">健康资讯</a>
		        <a class="link" @click="user()">个人中心</a>
		    </div>
		</div> -->
		<div style="margin-top: 420px;margin-left: 100px;margin-right: 100px;">
		      <div style="color: #333333;">
		        <el-tabs v-model="activeName" type="card">
		          <el-tab-pane
		            v-for="item in categoryList"
		            :key="item.category_id"
		            :label="item.category_name"
		            :name="''+item.category_id"
		          />
		        </el-tabs>
		      </div>
			  
			  
		</div>
		
		<div style="height: 70px;width: 100%;position: fixed;bottom: 0;text-align: center;">
			<br />
			<p style="font-size:12px;text-align:center;">
				Copyright 2020 多吃黑芝麻.AllRightsReserved. 
			</p>
			<br />
			<p style="font-size:12px;text-align:center;">
				声明：所有信息和文章均来自互联网 如有异议 请与本站联系
			</p>
		</div> 
	</div>
</template>

<script>
	import img1 from "../../assets/home/1.png"
	export default {
	  data() {
	    return {
			categoryList:[
				{category_id:1,category_name:"热门"},
				{category_id:2,category_name:"今日更新"},
			],
			activeName:'',
			img1:img1,
	    };
	  },
	  
	  methods: {
	    handleSelect(key, keyPath) {
	      console.log(key, keyPath);
	    },
		  problem(){
			  this.$router.push('/problem')
		  },
		  home(){
		  		  this.$router.push('/')
		  }, 
		  news(){
		  		  this.$router.push('/news')
		  },
		  user(){
			  this.$router.push("/user")
		  },
	  }
	}
</script>

<style>
	 .aaaa img{
		width: 500px;
		height: 400px; 
		position:absolute;
		top:26%;
		left: 100px;
		z-index: 0;
		
	} 
	.aaaa img:hover {
	    width: 500px;
	    height: 400px;
	    transform: scale(1.05, 1.05);
	 }
	.aaa img{
		width: 200px;
		height: 199px; 
		margin-left:610px;
		position:absolute;
		top:26%;
		z-index: 0;
	}
	.aaa img:hover {
	    width: 200px;
	    height: 199px;
	    transform: scale(1.1, 1.1);
	 }
	
	
	 .aa img{
		width: 200px;
		height: 199px; 
		margin-left:610px;
		position:absolute;
		margin-top: 200px;
		z-index: 0;
	}
	
	 .aa img:hover {
	     width: 200px;
	     height: 199px;
	     transform: scale(1.1, 1.1);
	  }
</style>
<style>
	.ttt .link{
	    display: inline-block;
	    font-size: 15px;
	    padding-left: 30px;
		margin-top: 420px;
	    min-width:100px;
	    text-align: center;
	    color:#fff;
		background-color: #333333;
	}
	.ttt .menu{
	    width:100px;
	    padding-right:30px;
	    position: relative;
	}
	.ttt a:hover{
	    color:#ff0000;
	}
</style>
<style>
        .new_list_con{
			float: right;
            width: 480px;
            height: 390px;
            border: 1px solid #ddd;
            margin: 10px; 
			text-align: center;
            /*  多余的部分，进行裁剪 */
            overflow: hidden;
        }

        .new_list_con h3{           
            width: 450px;
            height: 50px;   
            /* 设置下划线 */
            border-bottom: 1px solid #ddd;
            /*  居中，对齐 */
            margin: 0 auto;

        }

        .new_list_con h3 span{
            /*  转换为内联块元素 */
            display: inline-block;
            height: 50px;
            border-bottom: 2px solid #0086F1;
            font: 18px/50px 'Microsoft Yahei';
            color: #000;
            /* 清除span的padding的上下属性 */
            padding:0 15px;
            position: relative;
        }

        .new_list_con div{
            /* 清除链接前面的“小圆点” */
            list-style: none;
            /* 清除ul的padding属性 */
            padding: 0;
            width: 450px;
            height: 238px;
            /*  设置左右间距 */
            margin: 7px auto 0;
        }

        .new_list_con div li{
            /*  设置每一行的行高，行宽由内容撑开 */
            height: 30px;
            /*  设置每一行的下划线 */
            /* border-bottom: 1px solid #ddd; */
        }

        .new_list_con div a{
            /*  向左浮动 */
            float: left;
            /*  设置字体大小，行宽，字号 */
            font: 14px/30px 'Microsoft Yahei';
            /*  清除下划线 */
            text-decoration: none;
            /*  设置字体颜色 */
            color: #000;
			width: 200px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			display: block;
        }

        .new_list_con div span{
            /*  日期，向右浮动 */
            float: right;
            /* 设置行宽 */
            height: 30px;
            /* 居中对齐 */
            line-height: 30px;
            color: #000;
        }

        .new_list_con div a:before{
            /* 在文字前面加“小圆点” */
            content: '· '
        }

        .new_list_con div a:hover{
            /* 触摸变色 */
            color: #0086F1;
        }

    </style>
	