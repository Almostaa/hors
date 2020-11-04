<template>
	  <div class="poster">
		<el-form class="register-container" label-position="left" ref="registerForm" :model="registerForm" :rules='rules'>
		  <h3 class="register_title">患者注册平台</h3>
		  <el-form-item  prop="phonenumber">
		      <el-input size="medium" v-model="registerForm.phonenumber" placeholder="联系电话"></el-input>
		  </el-form-item>
		  <el-form-item prop="code">
		  		<el-input v-model="code" 
				 style="width: 55%;"
				 size="medium"
				 placeholder="验证码"></el-input>
				<el-button style="float: right;margin-top: 3px;width: 40%;border: 0;"  size="medium"
				 @click="setsmCode()" :disabled="isDisabled">{{buttonText}}</el-button>
		  </el-form-item>
		  <el-form-item prop="password">
			<el-input type="password" size="medium" v-model="registerForm.password"  placeholder="密码" show-password></el-input>
		  </el-form-item>
		  <el-form-item >
		      <el-button size="medium" type="primary" 
			  style="width: 100%;border: none;color: #000000;"
			   :disabled="!(code && registerForm.password && registerForm.phonenumber )"
			   @click="submitForm()">注册</el-button>
			   <el-button type="text" class="register-tips" @click="handleLogin()">已有账号，去登录>></el-button>
		  </el-form-item>
			
		</el-form>
	</div>
</template>
 
 
<script>
	
	import { smsStudent,registerform } from "../api/user.js"
    export default {
        name: "register",
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
			//  <!--验证码是否为空-->
			let checkSmscode = (rule, value, callback) => {
			  if (value === '') {
			    callback(new Error('请输入验证码'))
			  } else {
			    callback()
			  }
			};
            return {
                registerForm: {
                    phonenumber: '',
                    password: ''					
                },
				code:'',
				formList:{},
				rules:{
					phonenumber: [
					    {validator: validatePhone, trigger: 'blur' }
					],
					password: [
					    {validator: validatePass, trigger: 'blur' }
					],
					code: [{ validator: checkSmscode, trigger: 'blur' }],
				},
				buttonText: '发送验证码',
				isDisabled: false, // 是否禁止点击发送验证码按钮
				flag: true,
            }
        },
		
        methods: {
			//验证码
			setsmCode () {
				smsStudent({
						phone:this.registerForm.phonenumber,
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
			//提交注册
			submitForm() {
				
				const user={
					phonenumber:this.registerForm.phonenumber,
					password:this.registerForm.password,
				}
				const code=this.code
				
				 this.$axios({
					method: 'post',
					url: 'http://localhost:8088/user/register',
					data: {user,code}
				})
				.then(data => {
					console.log("code"+data)
				}).catch(() => {});
				 
				
				/* registerform({
					user:this.registerForm,
				})
				.then(r => { 
					console.log("sss"+r) */
					/* const obj={
						user:this.registerForm,
					}
					const code=this.code
					this.$axios.post("http://localhost:8088/user/register",obj,code)
					.then(data => {
						console.log("code"+data)
					}).catch(() => {}); */
				/* }).catch(() => {}); */
				
				
				/* this.formList = this.registerForm,
				console.log( this.formList)
				console.log( this.code)
				console.log( this.formList,this.code)
				registerform({
					user:this.formList,
					code:this.code
				})
				.then(r => {
					console.log('呱呱呱呱呱呱呱呱呱'+r)
				})
				.catch(() => {}); */
					      
			},	

            handleLogin() {
                this.$router.push('/login')
            },
			home(){
			 	this.$router.push('/')
			 },
        },
    }
</script>
 
<style>
  .poster {
	background-image: url(../assets/img/4.jpg);
    background-position: center;
    height: 100%;
    width: 100%;
    background-size: cover;
    position: fixed;
  }
  .register-container {
	background:rgba(255, 255, 255, 0.2) none repeat scroll !important;
    border-radius: 15px;
    background-clip: padding-box;
    margin: 150px auto;
    width: 250px;
    padding: 20px 35px 10px 35px;
    background: #fff;
    border: 1px solid #eaeaea;
    box-shadow: 0 0 25px #cac6c6;
  }
 
  .register_title {
    margin: 0px auto 10px auto;
    text-align: center;
    color: #000000;
  }
  .register-tips {
      font-size: 5px;
      color: #000;
      float: right;
	  height: 10px;
	  margin-top: 5px;
  }
  .register-tips:hover {
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
 