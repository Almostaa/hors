<template>
	<div>
		<div id="top" class="top" >
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
		
		
		<div class="iiisss" style="margin-left: 183px;">
			<div class="imgsss">
				<img v-if="douser.doctor && douser.doctor.picture" :src="serviceImgURl+douser.doctor.picture" />
			</div>
			<div class="lllsss">
				<h4 v-if="douser.doctor && douser.doctor.dname">{{douser.doctor.dname}}</h4>
				<span style="font-size: 10px;" v-if="douser.doctor && douser.doctor.rank">{{douser.doctor.rank}}</span>
				<p style="height: 10px;"></p>
				<p>简介：</p>
				<p style="text-indent: 2em;" v-if="douser.doctor && douser.doctor.describe">{{douser.doctor.describe}}</p>
				<el-button type="warning"  v-if="douser.chargeType && douser.chargeType.priceTypeName"
				style="border-radius: 8px;position:fixed;top: 55%;"
				>{{douser.chargeType.priceTypeName}} ： {{douser.fee}}￥</el-button>
				<el-button type="primary" @click="gotohello(douser.doctor.dno)" 
					style="width: 130px;border-radius: 8px;position:fixed;top: 55%;margin-left: 300px;"
				>点击咨询</el-button>
			</div>
		</div>
		
		<div>
			<div style="border-radius: 0px;border: 1px solid #ffff00;box-shadow: 0 0 25px #cac6c6;width: 200px; position:absolute;right:115px;top:24%;">
				<h2 style="border-bottom: 1px solid black;margin: 10px 10px ;">咨询须知</h2>
				<p style="margin: 5px 5px;">① 身份信息必须与就诊者保持一致；</p>
				<p style="margin: 5px 5px;">② 咨询时间为五分钟，请提前做好准备；</p>
				<p style="margin: 5px 5px;">③ 医生上班时间为9:00-12:00,14:00-17:00;</p>
				<p style="margin: 5px 5px;">④ 除医生上班时间外，其他时间咨询将在上班时间内回复；</p>
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
		<Edit :showEditDialog="showDialog" @close="showDialog = false" />
	</div>
</template>

<script>
	import { serverApiUrl } from "../../config/apiUrl" 
	import {getDoctorinquiryFee} from "../../api/charge.js"
	import Edit from "../../views/page/hello.vue"
	import {getToken,getUserInfo} from "../../utils/common.js"
	export default {
	  data() {
	    return {
			usernumber:'',
			token:null,
			douser:{},
			id:null,
			serviceImgURl: serverApiUrl+'/images/doctor/',
			showDialog:false,
	    };
	  },
	  created() {
		this.token = getToken()
		this.usernumber=getUserInfo().phoneNumber
		
		
		this.id=this.$route.query.id;
	  	getDoctorinquiryFee({id:this.id})
	  	.then(n=>{
	  		this.douser=n
	  		this.$parent.id=null;
	  	})
	  	.catch(()=>{})
	  },
	  methods:{
		  gotohello(id) {
		    this.id = id;
			if(getToken() == '' || getToken() == null){
				this.login()
			}else{
				this.showDialog = true
			}
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
		  logout() {
		  	localStorage.clear();
		  	this.$router.push('/')
		  },
	  },
	  components:{Edit}
	}
</script>

<style>
	.iiisss{
		width: 850px;
		height: 250px;
		/* margin-left: 200px; */
		border: solid 1px gray;
		overflow: hidden;
	}
	.imgsss{
		width: 130px;
		float: left;
	}
	.imgsss img{
		display: block;
		width: 100%;
		height: 200px;
	}
	.lllsss{
		float: right;
		width: 700px;
	}
	.lllsss p{
		overflow: hidden;
		word-break:break-all;
		width:690px; 
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 6;
	}
</style>
