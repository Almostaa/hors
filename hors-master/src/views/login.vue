<template>
	<div class="login">
		<el-form class="login-container" label-position="left" label-width="0px" ref="loginForm" :model="loginForm" :rules='rules'>
			<el-tabs v-model="activeName">
				<el-tab-pane label="账号密码登录" name="first">
					<el-form-item prop="phoneNumber">
						<el-input type="text" v-model="loginForm.phoneNumber" auto-complete="off" placeholder="手机号"></el-input>
					</el-form-item>
					<el-form-item prop="passWord">
						<el-input type="password" v-model="loginForm.passWord" auto-complete="off" placeholder="密码" show-password></el-input>
					</el-form-item>
				</el-tab-pane>
				<el-tab-pane label="验证码登录" name="second">
					<el-form-item prop="phoneNumber">
						<el-input type="text" v-model="loginForm.phoneNumber" auto-complete="off" placeholder="手机号">		</el-input>
					</el-form-item>
					<el-form-item prop="code">
						<el-input v-model="loginForm.code" 
							style="width: 55%;"
							placeholder="验证码"></el-input>
							<el-button style="float: right; height: 40px;width: 40%;border: 0;" 
							@click="setsmCode()" :disabled="isDisabled">{{buttonText}}</el-button>
					</el-form-item>
				</el-tab-pane>
			  </el-tabs>
			<el-form-item style="width: 100%">
				<el-button type="primary"
						style="width: 100%;border: none;color: #000000;"
						 @click="clicklogin()">登录
				</el-button>
				<el-button type="text" class="tips" @click="forget()">忘记密码</el-button>
				<el-button type="text" class="login-tips" @click="handleRegister()">没有账号，去注册>></el-button>
				</el-form-item>
		</el-form>
	</div>
</template>

<script>
	
	import { login , smsStudent } from "../api/user.js"
	import {setToken , setUserInfo} from "../utils/common.js"
	export default {
	    data() {
			var validatePhone = (rule, value, callback) => {
			    if (!value) {
			        return callback(new Error('请输入电话号码'));
			    }
			    else {
			        var reg1 = /^[0-9]{11}$/;
			        if (! reg1.test(value)) {
			            callback(new Error('请输入正确的电话号码'));
			        } else {
			            callback();
			        }
			    }
			};
			var validatePass = (rule, value, callback) => {
			    if (value === '') {
			        callback(new Error('请输入密码'));
			    }else if(!/^(?![0-9]*$)(?![a-zA-Z]*$)[a-zA-Z0-9]{6,10}$/.test(value)){
					callback(new Error('密码必须为6-10位字母和数字组合'))
				}else {
			        callback();
			    }
			};
			let checkSmscode = (rule, value, callback) => {
			  if (value === '') {
			    callback(new Error('请输入验证码'))
			  } else {
			    callback();
			  }
			};
	      return {
	        activeName: 'first',
			loginForm: {
			    phoneNumber: '',
			    passWord: '',
				code:''
			},
			
			buttonText: '发送验证码',
			isDisabled: false, // 是否禁止点击发送验证码按钮
			flag:true,
			rules:{
				phoneNumber: [
				    {validator: validatePhone, trigger: 'blur' }
				],
				passWord: [
				    {validator: validatePass, trigger: 'blur' }
				],
				code: [
					{ validator: checkSmscode, trigger: 'blur' },
				],
			}
	      };
	    },
	    methods: {
			//发送验证码
			setsmCode () {
				smsStudent({
						phone:this.loginForm.phoneNumber
					})
				.then(r=>{
					console.log(r)
					let time = 60
					this.buttonText = '已发送'
					this.isDisabled = true
					if (this.flag) {
					  this.flag = false;
					  let timer = setInterval(() => {
					    time--;
					    this.buttonText = time + ' 秒'
					    if (time === 0) {
					      clearInterval(timer);
					      this.buttonText = '重新获取'
					      this.isDisabled = false
					      this.flag = true;
					    }
					  }, 1000)
					}
				})
				.catch(()=>{});	
			},
			//点击登录
			clicklogin() {
				const activeName = this.activeName;
				
				if( activeName == 'first'){
					
					console.log(this.loginForm.phoneNumber,this.loginForm.passWord)
						  login({
							  phoneNumber:this.loginForm.phoneNumber,
							  passWord:this.loginForm.passWord,
						  })
						  .then(r => {
							
							  if (r.code == 200) {
								  this.$message({
								  	message:'登录成功',
								  	type:'success'
								  })
								  /* localStorage.setItem("token",r.data.token);
								  localStorage.setItem("usernumber",r.data.user.phoneNumber)
								  localStorage.setItem("userno",r.data.user.userNo)
								   */
								  
								  setUserInfo(r.data.user);
								  setToken(r.data.token);
								  localStorage.setItem("accid", r.data.userImInfo.accid)
								  localStorage.setItem("imToken", r.data.userImInfo.token)
								
								  this.$router.push('/') 
							  } else {
							    this.$message({
							  		message: "用户名或密码错误！",
							  		type: "error"
							   });
							  }
							/* console.log(r);
							this.$message({
							  type: r.code,
							  message: r.message
							});
							if(r.message === 'Ok'){
								this.handleLogin()
							} */
						  }).catch(() => {});
				}else{
						  login({
							phoneNumber:this.loginForm.phoneNumber,
							code:this.loginForm.code
						  })
						  .then(r => {
							  if (r.code == 200) {
								this.$message({
									message:'登录成功',
									type:'success'
								})
							   /* localStorage.setItem("token",r.data.token)
							    localStorage.setItem("usernumber",r.data.user.phoneNumber)
							    localStorage.setItem("userno",r.data.user.userNo) */
							   
								setUserInfo(r.data.user);
								setToken(r.data.token);
								
								localStorage.setItem("accid", r.data.userImInfo.accid)
								localStorage.setItem("imToken", r.data.userImInfo.token)
								 this.gotohome()
								 
							  } else {
							    this.$message({
							  		message: "用户名或验证码错误！",
							  		type: "error"
							   });
							  }
						
						  }).catch(() => {});
				}
			},
			forget(){
				this.$router.push('/forget')
			},
			handleRegister() {
			    this.$router.push('/register')
			},
			handleClick(tab, event) {
				console.log(tab, event);
			},
			gotohome(){
				this.$router.push('/')
			}
	    }
	  };
</script>

<style>
	.login {
		background-image: url(../assets/img/3.jpg);
		position: absolute;
		width: 100%;
		height: 100%;
		overflow: hidden;
		background-size:cover;
	}
	.login-container {
	  background:rgba(255, 255, 255, 0.2) none repeat scroll !important;
	  border-radius: 15px;
	  background-clip: padding-box;
	  margin: 180px 700px auto;
	  width: 250px;
	  padding: 20px 35px 10px 35px;
	  background: #fff;
	  border: 1px solid #eaeaea;
	  box-shadow: 0 0 25px #cac6c6;
	}
	.login-tips {
	    font-size: 5px;
	    color: #000;
	    float: right;
		height: 10px;
	    margin-top: 5px;
	}
	.login-tips:hover {
	    color: #409eff;
	}
	
	.tips {
	    font-size: 5px;
	    color: #000;
	    float: left;
		height: 10px;
	    margin-top: 5px;
	}
	.tips:hover {
	    color: #409eff;
	}
	 
</style>