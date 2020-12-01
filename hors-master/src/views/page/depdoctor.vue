<template>
	<div>
		<div id="top" class="top">
		  <div class="wrap">
		      <p class="call">888-888/888888电话预约</p>
		      <p class="welcome" v-if="token == null">欢迎来到多吃黑芝麻健康服务平台&nbsp;请&nbsp;&nbsp;
		          <a @click="login()" style="cursor:pointer">登录</a>&nbsp;|
		          <a @click="register()" style="cursor:pointer">注册</a>
		      </p>
		      <p class="welcome" v-else >欢迎来到多吃黑芝麻健康服务平台:{{usernumber}}
		      	<button @click="logout" type="button">退出登录</button>
		      </p>
		  </div>
		</div>
		<div id="header" class="header">
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
		
		<div class="single-member effect-3" style="margin-left: 110px;margin-right: 100px;">
			<el-row >
			  <el-col :span="6" v-for="(d,o) in douser" :key="o" style="padding: 40px;"  >
					  <router-link :to="{ path: '/fast', query:{id:d.dno}}">
						<el-card :body-style="{ padding: '0px' }" style="cursor: pointer;">
						  <img :src="serviceImgURl+d.picture" class="image">
						  <div style="padding: 4px;">
							<span>{{d.dname}}</span>
							<div>
								<p style="text-indent: 2em;font-size: 5px;">{{d.rank}}</p>
							</div>
							<div class="bottom clearfix">
							  <time class="time">{{d.describe}}</time>
							  <el-button type="text" class="button">点击预约</el-button>
							</div>
						  </div>
						</el-card>
					  </router-link>
			  </el-col>
			</el-row>
			 
		</div>
		
		
		<!-- <div class="single-member effect-3" v-for="d in douser" style="margin-left: 110px;" @click="fast(d.dno)">
		  <div class="member-image">
		    <img :src="serviceImgURl+d.picture" />
		  </div>
		  <div class="member-info">
		    <h3 >{{d.dname}}</h3>
		    <h5>{{d.rank}}</h5>
		    <p>{{d.describe}}</p>
		    <div class="social-touch">
		      <a class="linkedin-touch"  style="width: 100px;">点击预约</a>
		    </div>
		  </div>
		</div> -->
		
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
	
	import {getDoctorList} from "../../api/doctor.js"
	import { serverApiUrl } from "../../config/apiUrl" 
	import {getToken,getUserInfo} from "../../utils/common.js"
	export default {
	  data() {
	    return {
			usernumber:'',
			token:null,
			douser:[],
			id:'',
			serviceImgURl: serverApiUrl+'/images/doctor/',
	    };
	  },
	  created() {
		  
		this.token = getToken()
		this.usernumber=getUserInfo().phoneNumber
		
	  	this.id=this.$route.query.id;
		console.log("sss"+this.id)
		getDoctorList({id:this.id})
		.then(n=>{
			console.log(n)
			this.douser=n
			this.$parent.id=null;
		})
		.catch(()=>{})
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
		  login(){
		     this.$router.push("/login")
		  },
		  register(){
		  	this.$router.push("/register")
		  },
		  /* fast(id){
			this.$router.push({
				name:'fast',
				params:{
					id:id
				}
			})
		  }, */
		  logout() {
		  	localStorage.clear();
		  	this.$router.push('/')
		  },
	  }
	}
</script>
<style>
  .time {
	overflow: hidden;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
    font-size: 13px;
    color: #999;
	
  }
  .button {
    padding: 0;
    float: right;
	padding-right: 10px;
  }

  .image {
    width: 210px;
	height: 220px;
    display: block;
  }

  .clearfix:before,
  .clearfix:after {
      display: table;
      content: "";
  }
  
  .clearfix:after {
      clear: both
  }
</style>
<!-- <style>
	.member-info p{
		overflow: hidden;
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 3;
	}
	.single-member{
	  width: 280px; 
	  float: left; 
	  font-family: sans-sarif; 
	  margin: 30px 2.5%; 
	  background-color: #fff; 
	  text-align: center; 
	  position: relative;
	}
	.single-member .member-image img{
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
	  cursor: pointer;
	  display: inline-block; 
	  width: 27px; 
	  height: 26px; 
	  vertical-align: middle; 
	  margin: 0 2px; 
	  background-color: #FFFFFF;
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
 -->