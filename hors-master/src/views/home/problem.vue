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
		        <div class="link menu" @click="home()">全部科室
		          
		        </div>
		        <a class="link" @click="problem()">专家问诊</a>
		        <a class="link" @click="news()">健康资讯</a>
		        <a class="link" @click="user()">个人中心</a>
		    </div>
		</div>
		
		<div >
		      <div>
		        <div style=" width: 50px;font-size: 16px;font-weight: 700;float: left;text-align: center;margin-top: 9px;">分类</div>
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

		
		
		<div class="single-member effect-3" v-for="d in douser" style="margin-left: 110px;">
		  <div class="member-image">
		    <img :src="d.img">
		  </div>
		  <div class="member-info">
		    <h3 >{{d.name}}</h3>
		    <h5>{{d.rank}}</h5>
		    <p>{{d.desc}}</p>
		    <div class="social-touch">
		      <a class="linkedin-touch" @click="fast()" style="width: 100px;">点击咨询</a>
		    </div>
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
			activeName:'',
			categoryList:[
				{category_id:1,category_name:"内科"},
				{category_id:2,category_name:"外科"},
			],
			douser:[
				{
					img:img1, name:"张三",rank:'主任',desc:"创立武当派、振兴道教、发扬太极拳、武学泰山北斗"
				},
				{
					img:img1, name:"张三",rank:'主任',desc:"创立武当派、振兴道教、发扬太极拳、武学泰山北斗"
				},
				{
					img:img1, name:"张三",rank:'主任',desc:"创立武当派、振兴道教、发扬太极拳、武学泰山北斗"
				}
			]
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
	.single-member{
	  width: 280px; 
	  float: left; 
	  font-family: sans-sarif; 
	  margin: 30px 2.5%; 
	  background-color: #fff; 
	  text-align: center; 
	  position: relative;
	}
	.member-image img{
	  max-width: 100%; 
	  vertical-align: middle;
	}
	.single-member h3 {
	  font-size: 24px; 
	  font-weight: normal; 
	  margin: 10px 0 0; 
	  text-transform: uppercase;
	}
	.single-member h5 {
	  font-size: 16px; 
	  font-weight: 300; 
	  margin: 0 0 15px; 
	  line-height: 22px;
	}
	.single-member p {font-size: 14px; 
	  font-weight: 300; 
	  line-height: 22px; 
	  padding: 0 30px; 
	  margin-bottom: 10px;
	}
	.social-touch a{
	  display: inline-block; 
	  width: 27px; 
	  height: 26px; 
	  vertical-align: middle; 
	  margin: 0 2px; 
	  background-image: url(../../assets/home/2.png);
	  /* background-image: url(images/social-icons.png); */
	  background-repeat: no-repeat; 
	  opacity: 0.7; 
	  transition: 0.3s;
	}
	.social-touch a:hover{
	  opacity: 1; 
	  transition: 0.3s;
	}
	.fb-touch{
	  background-position: 0 0;
	}
	.tweet-touch{
	  background-position: -35px 0;
	}
	.linkedin-touch{
	  background-position: -71px 0;
	}
	.icon-colored .fb-touch{
	  background-position: 0 -27px;
	}
	.icon-colored .tweet-touch{
	  background-position: -35px -27px;
	}
	.icon-colored .linkedin-touch{
	  background-position: -71px -27px;
	}
</style>

<style>
	.effect-3{
	  max-height: 302px; 
	  min-height: 302px; 
	  overflow: hidden;
	}
	.effect-3 h3{
	  padding-top: 7px; 
	  line-height: 33px;
	}
	.effect-3 .member-image{
	  border-bottom: 5px solid #e5642b; 
	  transition: 0.4s; 
	  height: 212px; 
	  width: 100%; 
	  display: inline-block; 
	  float: none; 
	  vertical-align: middle;
	}
	.effect-3 .member-info{
	  transition: 0.4s;
	}
	.effect-3 .member-image img{
	  width: 100%; 
	  vertical-align: bottom;
	}
	.effect-3 .social-touch{
	  background-color: #e5642b; 
	  float: left; 
	  left: 0; 
	  bottom: 0; 
	  overflow: hidden; 
	  padding: 5px 0; 
	  width: 100%; 
	  transition: 0.4s;
	}
	.effect-3:hover .member-image{
	  border-bottom: 0; 
	  border-radius: 0 0 50px 50px; 
	  height: 81px; 
	  display: inline-block; 
	  overflow: hidden; 
	  width: 109px; 
	  transition: 0.4s;
	}
</style>