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
		<div style="margin-left: 183px;margin-top:0px;">
			  <el-tabs type="border-card" :tab-position="tabPosition" style="height: 500px;">
			    <el-tab-pane label="账号管理">
			    	<el-col :span="8">
			    		<el-form :label-position="labelPosition" :rules="rules" ref="people" label-width="80px" :model="people">
			    			<div style="margin: 20px;"></div>
			    			<el-form-item label="姓名">
			    				<el-input v-model="people.username"></el-input>
			    			</el-form-item>
			    			<el-form-item label="性别">
			    				<el-input v-model="people.sex"></el-input>
			    			</el-form-item>
			    			<el-form-item label="身份证号">
			    				<el-input v-model="people.idcard"></el-input>
			    			</el-form-item>
			    			<el-form-item label="社保卡号">
			    				<el-input v-model="people.socialcard"></el-input>
			    			</el-form-item>
			    			<el-form-item label="联系电话">
			    				<el-input v-model="people.phone"></el-input>
			    			</el-form-item>
			    			<el-form-item>
			    				<el-button type="primary" @click="submitForm('people')">确定</el-button>
			    				<el-button @click="resetForm('people')">取消</el-button>
			    			</el-form-item>
			    		</el-form>
			    	</el-col>			   
				</el-tab-pane>
			    <el-tab-pane label="我的预约">
					<el-table
					    :data="tableData"
					    stripe
					    style="width: 100%">
					    <el-table-column
					      prop="date"
					      label="订单编号"
					      width="180">
					    </el-table-column>
					    <el-table-column
					      prop="name"
					      label="挂号人姓名"
					      width="180">
					    </el-table-column>
					    <el-table-column
					      prop="address"
					      label="医生姓名">
					    </el-table-column>
						<el-table-column
						  prop="address"
						  label="创建时间">
						</el-table-column>
						<el-table-column
						  prop="address"
						  label="关闭时间">
						</el-table-column>
					  </el-table>
				</el-tab-pane>
			    <el-tab-pane label="门诊记录">
					<el-table
					    :data="tableData"
					    stripe
					    style="width: 100%">
					    <el-table-column
					      prop="date"
					      label="问诊号"
					      width="180">
					    </el-table-column>
					    <el-table-column
					      prop="name"
					      label="挂号人姓名"
					      width="180">
					    </el-table-column>
					    <el-table-column
					      prop="address"
					      label="医生姓名">
					    </el-table-column>
						<el-table-column
						  prop="address"
						  label="创建时间">
						</el-table-column>
						<el-table-column
						  prop="address"
						  label="关闭时间">
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
	export default {
	  data() {
	    return {
			tabPosition: 'left',
			labelPosition: 'left',
			people:{
				id:1,
				username:'冯大大',
				sex:'女',
				phone:'15252525252',
				idcard:'124565321236541236',
				socialcard:'555555555555555'
			},
			tableData: [{
			    date: '2016-05-02',
			    name: '王小虎',
			    address: '上海市普陀区金沙江路 1518 弄'
			}],
			 showEditDialog: false,
	    };
	  },
	  methods: {
	  	submitForm(formName) {
        	this.$refs[formName].validate((valid) => {
          	if (valid) {
            	alert('submit!');
          	} else {
            	console.log('error submit!!');
            	return false;
          	}
        	});
      	},
        resetForm(formName) {
          this.$refs[formName].resetFields();
        },
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
		  forget(){
		  	this.$router.push('/forget')
		  },
		  login(){
		     this.$router.push("/login")
		  },
		  register(){
		  	this.$router.push("/register")
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
