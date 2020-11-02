<template>
	  <div class="poster">
		<el-form class="register-container" label-position="left" label-width="0px" ref="registerForm" :model="registerForm" :rules='rules'>
		  <h3 class="register_title">重置密码</h3>
		  <el-form-item  prop="phone">
		      <el-input size="medium" v-model="registerForm.phone" placeholder="联系电话"></el-input>
		  </el-form-item>
		  <el-form-item prop="smscode">
		  		<el-input v-model="registerForm.smscode" 
				 style="width: 55%;" size="medium"
				 placeholder="验证码"></el-input>
				<el-button style="float: right;width: 40%;border: 0;margin-top: 3px;"  size="medium"
				 @click="setsmCode()" :disabled="isDisabled">{{buttonText}}</el-button>
		  </el-form-item>
		  <el-form-item prop="password">
			<el-input type="password" size="medium" v-model="registerForm.password"  placeholder="输入新密码" show-password></el-input>
		  </el-form-item>
		  <el-form-item prop="supassword">
		  			<el-input type="password" size="medium" v-model="registerForm.supassword"  placeholder="确认密码" show-password></el-input>
		  </el-form-item>
		  <el-form-item >
		      <el-button size="medium" type="primary" 
			  style="width: 100%;border: none;color: #000000;"
			   :disabled="!(registerForm.name && registerForm.password && registerForm.phone && registerForm.supassword )"
			   @click="submit('registerForm')">确认提交</el-button>
		  </el-form-item>
			
		</el-form>
	</div>
</template>
 
 
<script>
	
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
			var validatedbPass = (rule, value, callback) => {
			    if (value === '') {
			        callback(new Error('请再次输入密码'));
			    } else if (value !== this.registerForm.password) {
			        callback(new Error('两次输入密码不一致!'));
			    } else {
			        callback();
			    }
			};
            return {
				vedioCanPlay: false,
				fixStyle: '',
				PATH_TO_MP4: '',
                registerForm: {
                    phone: '',
					smscode:'',
                    password: '',
					supassword:'',
                },
				rules:{
					phone: [
					    {validator: validatePhone, trigger: 'blur' }
					],
					password: [
					    {validator: validatePass, trigger: 'blur' }
					],
					smscode: [{ validator: checkSmscode, trigger: 'blur' }],
					supassword:[{ validator: validatedbPass , trigger:'blur'}]
				},
				buttonText: '发送验证码',
				isDisabled: false, // 是否禁止点击发送验证码按钮
            }
        },
		
        methods: {
			sendCode () {
				yz({
						phone:this.registerForm.phone,
					})
				.then(r=>{
					console.log(r)
					this.$message({
					  type: "success",
					  message: r.msg
					});
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
			//提交新密码
			submit(formName) {
			  this.$refs[formName].validate(valid => {
			    if (valid) {
					zc({
						supassword:this.registerForm.supassword,
						password:this.registerForm.password,
						phone:this.registerForm.phone,
						yzm:this.registerForm.smscode
					}
					)
					.then(r => {
					  console.log(r);
					  this.$message({
					    type: "success",
					    message: r.msg
					  });
					  if(r.msg === '重置成功'){
					  	this.handleLogin()
					  }
					})
					.catch(() => {});
			      /* setTimeout(() => {
			        alert('注册成功')
			      }, 400); */
			    } else {
			      console.log("error submit!!");
			      return false;
			    }
			  })
			},
            handleLogin() {
                this.$router.push('/login')
            },
        },
    }
</script>
 
<style>
  .poster {
	background-image: url(../assets/img/7.jpg);
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
 
