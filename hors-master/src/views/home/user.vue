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
			<!-- 搜索框 -->
		    <div class="wrap">
		        <a href="#" class="logo"><img src="../../assets/images/logo.jpg"></a>
		    </div>
		</div>
		<div id="nav" class="nav">
		    <div class="wrap">
		        <div class="link menu" @click="home()" style="cursor: pointer;">全部科室</div>
		        <a class="link" @click="problem()" style="cursor: pointer;">专家问诊</a>
		        <a class="link" @click="news()" style="cursor: pointer;">健康资讯</a>
		        <a class="link" @click="user()" style="cursor: pointer;">个人中心</a>
		    </div>
		</div>
		
		<!-- 用户头像 -->
		<!-- <div class="card middle">
		      <div class="top-section">
		        <img src="../../assets/images/banner_1.jpg">
		      </div>
		      <div class="info-section">
		        <h2>username</h2>
		      </div>
		</div> -->
		
		<div style="margin-left: 183px;margin-top:0px;">
			  <el-tabs type="border-card" :tab-position="tabPosition">
			    <el-tab-pane label="账号管理">
					
					<el-card class="box-card">
  						<div slot="header" class="clearfix">
    						<span>用户信息</span>   							
  						</div>	
  						<div :data="people" id='ouser'>												
							<li>姓名：{{people.userName | name}}</li>
							<li>性别：{{people.sex}}</li>
							<li>手机号：{{people.phoneNumber | phone}}</li>																																			
							<li>身份证号：{{people.idCardNumber | idcard}}</li>
							<li>社保卡号：{{people.socialCard | idcard}}	</li><br />
							<el-button type="primary"  size="medium" @click="forget()" round>修改密码</el-button>	
							<el-button type="primary" size="medium" @click="showEditDialog = true" round>完善信息</el-button>							
						</div>						
					</el-card>
					
					
					<!-- <div :data="people">
						<li style="font-size: 20px;margin: 10px;">
							姓名：{{people.userName | name}}
						</li>
						<li style="font-size: 20px;margin: 10px;">
							性别：{{people.sex}}
						</li>
						<li style="font-size: 20px;margin: 10px;">
							手机号：{{people.phoneNumber | phone}}
						</li>
						<li style="font-size: 20px;margin: 10px;">
							身份证号：{{people.idCardNumber | idcard}}
						</li>
						<li style="font-size: 20px;margin: 10px;">
							社保卡号：{{people.socialCard | idcard}}
						</li><br />
						<button type="button" style="margin: 30px;color: #0000FF;height: 30px;"
							@click="forget()"
						>修改密码</button>
					
						<button type="button" style="margin: 30px;color: #0000FF;height: 30px;"
							@click="showEditDialog = true" >完善信息</button>
					</div> -->
				</el-tab-pane>
			    <el-tab-pane label="我的预约">
					<el-table
					    :data="apptInfoData"
					    stripe
					    style="width: 100%">
					    <el-table-column
					      prop="apptno"
					      label="编号"
					      width="80">					      
					    </el-table-column>
					    <el-table-column
					      prop="roomName"
					      label="科室"
					      width="100">					      
					    </el-table-column>
					    <el-table-column
					      prop="userName"
					      label="挂号人"
					      width="80">
					    </el-table-column>
					    <el-table-column
					      prop="sex"
					      label="性别">
					    </el-table-column>
					    <el-table-column
					      prop="age"
					      label="年龄">
					    </el-table-column>
					    <el-table-column
					      prop="dName"
					      label="医生">
					    </el-table-column>
						<el-table-column
						  prop="apptdate"
						  label="预约日期">
						</el-table-column>
						<el-table-column
						  prop="appttime"
						  label="预约时间">
						</el-table-column>
						<el-table-column
						  prop="price"
						  label="挂号费">
						</el-table-column>
						<el-table-column prop="state" label="支付状态">
						  <template slot-scope="s">
						  	<div v-if="s.row.state==1">
						  		<el-button type="primary" size="small" disabled>已支付</el-button>
						  	</div>
      						<div v-if="s.row.state==0">
      							<el-button type="primary" size="small" 
								@click.native="toSaveOrderAndPay(s.row.apptno,s.row.price,s.row.dName)">未支付</el-button>
      						</div>
      					  </template>
						</el-table-column>												
					  </el-table>
				</el-tab-pane>
			    <el-tab-pane label="门诊记录">
					<el-table
					    :data="consultInfoData"
					    stripe
					    style="width: 100%">
					    <el-table-column
					      prop="consultNo"
					      label="编号"
					      width="100">
					    </el-table-column>
					    <el-table-column
					      prop="userName"
					      label="问诊人"
					      width="100">
					    </el-table-column>
					    <el-table-column
					      prop="dname"
					      label="医生">
					    </el-table-column>
						<el-table-column
						  prop="startTime"
						  label="开始时间">
						</el-table-column>
						<el-table-column
						  prop="endTime"
						  label="结束时间">
						</el-table-column>
						<el-table-column
						  prop="price"
						  label="问诊费">
						</el-table-column>
						<el-table-column prop="state" label="支付状态">
						  <template slot-scope="s">
						  	<div v-if="s.row.state==1">
						  		<el-button type="primary" size="small" disabled>已支付</el-button>
						  	</div>
      						<div v-if="s.row.state==0">
      							<el-button type="primary" size="small" @click="payment(s.row.consultNo,s.row.price,s.row.dname)">未支付</el-button>
      						</div>							       					
      					  </template>
						</el-table-column>
						
					  </el-table>
				</el-tab-pane>
			  </el-tabs>
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
		<Edit :showEditDialog="showEditDialog" @close="showEditDialog = false" />

	</div>
</template>

<script>
	import Edit from "../page/add.vue";
	import {queryUserInfo,apptInfoList,consultInfoList} from "../../api/user.js"
	import {getToken,getUserInfo} from "../../utils/common.js"
	import {saveOrderAndPay,saveOrderAndPayC} from "../../api/charge.js"
	export default {
	  data() {
	    return {
			tabPosition: 'left',
			usernumber:'',
			token:null,
			people:{},
			apptInfoData:[],
			consultInfoData:[],
			showEditDialog: false,
			apptNo:'',
			consultNo:'',
	    };
	  },
	  created() {
	  	this.token = getToken()
	  	this.usernumber=getUserInfo().phoneNumber		
		this.selectuser();
		
	  },
	  methods: {
	  	//去支付
	  	toSaveOrderAndPay(id,price,dname) {
			console.log(id,price,dname)
			this.apptNo = id
			console.log(this.apptNo)
	  	    
	  	    saveOrderAndPay({
				out_trade_no:this.apptNo,subject:"预约挂号",
				total_amount:price,
				body:dname,
			})
	  	    .then(r => {
	  	        const divForm = document.getElementsByTagName('divform')
	  	            if (divForm.length) {
	  	                document.body.removeChild(divForm[0])
	  	            }
	  	            const div = document.createElement('divform')
	  	            div.innerHTML = r // data就是接口返回的form 表单字符串
	  	            document.body.appendChild(div)
	  	            document.forms[0].setAttribute('target', '_blank') // 新开窗口跳转
	  	            document.forms[0].submit()
	  	    })
	  	    .catch(() => {});
	  	},
		//支付门诊
		payment(id,price,dname){
			
			console.log(id,price,dname)
			this.consultNo = id
			console.log(this.consultNo)
			
			saveOrderAndPayC({
				out_trade_no:this.consultNo,
				subject:"门诊",
				total_amount:price,
				body:dname,
			})
			.then(r => {
			    const divForm = document.getElementsByTagName('divform')
			        if (divForm.length) {
			            document.body.removeChild(divForm[0])
			        }
			        const div = document.createElement('divform')
			        div.innerHTML = r // data就是接口返回的form 表单字符串
			        document.body.appendChild(div)
			        document.forms[0].setAttribute('target', '_blank') // 新开窗口跳转
			        document.forms[0].submit()
			})
			.catch(() => {});
		},
	  	 		  
		selectuser(){
			//console.log(this.userno+'ppp')
			queryUserInfo({
				userNo:getUserInfo().userNo
			}).then(r=>{
				this.people=r;
				//console.log(this.people)
			}).catch(r=>{})
			
			apptInfoList({usno:getUserInfo().userNo})
					.then(r => {
			  		this.apptInfoData = r.map(k=>{
			     		 k.apptInfoData = {}
							return k; 
			     		});
					})
			.catch(() => {});
			
			consultInfoList({usno:getUserInfo().userNo})
					.then(r => {
			  		this.consultInfoData = r.map(k=>{
			     		 k.consultInfoData = {}
			      	 return k;
			     	});       	
					})
			.catch(() => {});
			
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
		  forget(){
		  	this.$router.push('/forget')
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
	  components: { Edit }
	}
</script>

<style>
	.card{
	  width: 180px;
	  background: #f1f1f1;
	  overflow: hidden;
	  font-family: "montserrat",sans-serif;
	  box-shadow: 0 0 20px #0055ff;
	}
	.middle{
	  position: absolute;
	  top: 41%;
	  left: 20%;
	  transform: translate(-50%,-50%);
	}
	.top-section{
	  position: relative;
	}
	.top-section img{
	  width: 100%;
	}
	.menuicon{
	  position: absolute;
	  width: 22px;
	  left: 20px;
	  top: 20px;
	  cursor: pointer;
	}
	.menuicon span{
	  width: 100%;
	  height: 3px;
	  background: #000;
	  position: relative;
	  display: block;
	  margin-bottom: 6px;
	  opacity: .5;
	  transition: .4s;
	}
	.info-section{
	  padding: 20px;
	  padding-top: 15px;
	  color: #333;
	}
	.info-section h2{
	  position: relative;
	  font-size: 20px;
	}
</style>
