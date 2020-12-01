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
				<div>
					<el-button type="primary" @click="gotohello(doctorlist.dno)"
						style="width: 130px;border-radius: 8px;position:fixed;top: 55%;margin-left: 300px;"
					>点击咨询</el-button>
				</div>								
			</div>
		</div>
		
		<!-- 问诊须知 -->
		<div>
			<div style="border-radius: 0px;border: 1px solid #ffff00;box-shadow: 0 0 25px #cac6c6;width: 200px; position:absolute;right:112px;top:24%;">
				<h2 style="border-bottom: 1px solid black;margin: 10px 10px ;">问诊须知</h2>
				<p style="margin: 10px 10px;">① 在咨询时患者应尽可能完整的描述自己的症状，这样有助于医生判断疾病；</p>
				<p style="margin: 10px 10px;">② 医生询问患者的一些其他症状时，请对照自己认真回答，中医看病要结合整个身体状况，不是头疼只止痛，要问诊辨明原因，才能指导诊治；</p>
				<p style="margin: 10px 10px;">③ 请患者千万不要给自己通过网上百度咨询辨证用药，百度上的情况要么是共性问题，如同医生初学时教科书上讲的条条框框；</p>
			</div>
		</div>
		
		<div style="position: fixed;top: 13%;margin-left: 600px;z-index: 999;">
			<JwChat-index :taleList="list" scrollType="norell" :config="config" @enter="bindEnter"
			 v-model="inputMsg" :toolConfig="tool"  v-if="message" width="530px">
			  <div slot="tools">
				  <el-button type="danger" @click="shoudown()" size="mini">退出</el-button>
			  </div>
			  
			</JwChat-index>
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
		<Edit :showDialog="showDialog" @close="showDialog = false" />
	</div>
</template>

<script>
	import { serverApiUrl } from "../../config/apiUrl" 
	import {getDoctorinquiryFee,getConsultInfoState,updateDate} from "../../api/charge.js"
	import Edit from "../../views/pay/hello.vue"
	import {getToken,getUserInfo} from "../../utils/common.js"
	import {selectDoctorImInfo} from '@/api/doctor'
	import SDK from "@/store/NIM_Web_SDK_v8.1.0"
	import imgs from "@/assets/logo.png"
	import p1 from "@/assets/1.png"
	export default {
	  data() {
	    return {
			usernumber:'',
			token:null,
			douser:{},
			doctorlist:[],
			id:null,
			serviceImgURl: serverApiUrl+'/images/doctor/',
			showDialog:false,
			
			message:false,
			appkey  :'629375ea89b5f78b971a41d875a685ed',
			account:localStorage.getItem("accid"),
			im_token  :localStorage.getItem("imToken"),
			
			
			imgss:"",
			gettime:'',
			inputMsg: '',
			config: { historyConfig: {tip: '查看更多'} },
			list: [],
			tool: {
				show: ['file', 'history', 'img'],
				callback: this.toolEvent,
				showEmoji: true,
			},
			config: {
					img: imgs,
					name: '',
					dept: '',
					callback: this.headerEvent
			 },
			 
			sendMsgObj:'', 
			
			consultNo:'',
			
			

	    };
	  },
	  created() {
		  
		this.token = getToken()
		this.usernumber=getUserInfo().phoneNumber
		
		this.id=this.$route.query.id;
	  	getDoctorinquiryFee({id:this.id})
	  	.then(n=>{
	  		this.douser=n,
			this.doctorlist = n.doctor
			this.imgss=n.doctor.picture
	  		this.$parent.id=null;		
	  	})
	  	.catch(()=>{})
		//this.getDocIm()
		
		 //获取医生token accid
		 selectDoctorImInfo({accid:this.id})		 
		 .then(n=>{	
			 console.log(n)
			 console.log(n.accid)
			 this.sendMsgObj=n.accid
		 })
		 .catch(()=>{})
				
	  },
	  
	  mounted(){		
	  	 this.connectSDK() 
		 
		 this.consultNo=this.$route.query.orderid
		 console.log(this.$route.query.orderid+"===")
		 if(this.consultNo!=''){
			 getConsultInfoState({consultNo:this.consultNo})
			 .then(n=>{
				 console.log(n.state)
			 	 this.state = n.state
				 if(this.state == "1"){
					 this.message = true
					 this.addDoctor()
				 }
			 })
			 .catch(()=>{})
		 }
		 
	  },
	  methods:{
		  shoudown(){
			  updateDate({consultNo:this.consultNo})
			  .then(n=>{
					console.log(n)
					this.message='';
					this.message=false;
					
			  })
			  .catch(()=>{})
		  },
		  gotohello(id) {
			  console.log(id)
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
		  
		  
		 
		//获取当前时间
		  getTimes(){
			  
			  let yy = new Date().getFullYear();
			  let mm = new Date().getMonth()+1;
			  let dd = new Date().getDate();
			  let hh = new Date().getHours();
			  let mf = new Date().getMinutes()<10 ? '0'+new Date().getMinutes() : new Date().getMinutes();
			  let ss = new Date().getSeconds()<10 ? '0'+new Date().getSeconds() : new Date().getSeconds();
			  var time=yy+'-'+mm+'-'+dd+' '+hh+':'+mf+':'+ss;
			  return  this.gettime = time;
		  },
		  
		  bindEnter () {
		  const msg = this.inputMsg
		   this.sendm();	
		  
		  if (!msg) return;
		  const msgObj = {
			"date": this.getTimes(),
			"text": { "text": msg },
			"mine": true,
			"name":this.account,
			"img": p1
		  }
		  this.list.push(msgObj)
		},
		toolEvent (type) {
		  console.log('tools', type)
		},
		
		 connectSDK(){	
			
			 window.nim = SDK.NIM.getInstance({
			   appKey:this.appkey,
			   account:this.account,
			   token: this.im_token,
			   dubug:true,
			   onmsg: this.onMsg,
			   
			   
			  })
			  this.onconnect()
		 },
		 
		 
		 
		 onconnect() {
		   //alert('SDK 连接成功')
		   // 连接成功后才能发消息
			//this.sendm();			      
		 },
		 
		 addDoctor(){
			
		 	 var doctorAccount =this.sendMsgObj.toString()	
			 //alert(doctorAccount)
		 	 var add=window.nim.addFriend({
		 	     account: doctorAccount,
		 	     ps: 'ps',
		 	     done: this.addFriendDone
		 	 });
		  },
		  
		 addFriendDone(error, obj) {
		      console.log(error);
		      console.log(obj);
		      console.log('直接加为好友' + (!error?'成功':'失败'));
		  },

		 sendm(){
			 //this.sendMsgObj
		 	var tests = this.inputMsg.toString()
			//alert(this.sendMsgObj)
		 	var sendMsgObj =this.sendMsgObj.toString()		 	
		 	var msg =window.nim.sendText({
		 	  scene: 'p2p',
		 	  to: sendMsgObj,
		 	  text: tests,
			  done: this.sendMsgDone
		 	//pushMsg(msg);
		 	})
			console.log('正在发送p2p自定义消息, id=' + msg.idClient);
		 },
		sendMsgDone(error, msg) {
			console.log('发送' + msg.scene + ' ' + msg.type + '消息' + (!error?'成功':'失败') + ', id=' + msg.idClient, error, msg);
			
		},
		onMsg(msg) {				
		    console.log('收到消息', msg.scene, msg.type, msg);	
								
						var mymsg= {
			          "date": this.getTimes(),
			          "text": { "text": msg.text },
			          "mine": false,
			          "name": this.doctorlist.dname,
			          "img":this.serviceImgURl+this.imgss,
			        }
				this.list.push(mymsg);	
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
		width: 190px;
		float: left;
	}
	.imgsss img{
		display: block;
		width: 100%;
		height: 200px;
	}
	.lllsss{
		float: right;
		width: 645px;
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
