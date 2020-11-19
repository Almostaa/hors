<template>
	<el-dialog
	  @opened="openDialog"
	  :width="dialogWidth"
	  :title="title"  style="text-align: center;"
	  :visible.sync="showEditDialog"
	  :show-close="false"
	  :close-on-click-modal="false"
	>
	 <el-form :disabled="val" :model="forms" :rules="rules"  ref="editForms" class="edit-forms" label-position="left" :label-width="labelWidth">
	   <el-form-item label="姓名:" prop="userName" required>
	     <el-input  v-model="forms.userName"></el-input>
	   </el-form-item>
	 	<el-form-item label="性别:" prop="sex" required>
	 	  <el-input v-model="forms.sex"></el-input>
	 	</el-form-item> 
	   <el-form-item label="手机号:" prop="phoneNumber" required>
	     <el-input  v-model="forms.phoneNumber" disabled></el-input>
	   </el-form-item>
	   <el-form-item label="身份证号:" prop="idCardNumber" required>
	     <el-input v-model="forms.idCardNumber"></el-input>
	   </el-form-item>
	 		<el-form-item label="社保卡号:" prop="socialCard" required>
	 		  <el-input v-model="forms.socialCard"></el-input>
	 		</el-form-item>
	 </el-form>
	  <div slot="footer" class="dialog-footer">
	    <el-button @click="$emit('close')">取 消</el-button>
		<el-button type="primary" :disabled="val" @click="submit">确认</el-button>
	  </div>
	</el-dialog>
</template>

<script>
	import {queryUserInfo} from "../../api/user.js"
	import {forget } from "../../api/user.js"
	import {getUserInfo} from "../../utils/common.js"
	export default {
		props: {
		  title: {
		    type: String,
		    default: "完善身份信息，请填写本人真实信息",
		  },
		  dialogWidth: {
		    type: String,
		    default: "450px"
		  },
		  labelWidth: {
		    type: String,
		    default: "90px"
		  },
		  showEditDialog: Boolean
		},
		data() {
			var validatePass = (rule, value, callback) => {
			    if (value === '') {
			        callback(new Error('请输入身份证号'));
			    }else if(!/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(value)){
					callback(new Error('请输入正确的身份证号'));
				}else {
			        callback();
			    }
			};
			var ck=function(rule, value, callback){
				if(!/^[男女]$/.test(value)){
					callback(new Error("必须输入男或女"));
				}
				callback();
			}
			
			return {
				val:false,
				forms: {
				  userName: "",
				  sex: "",
				  phoneNumber: "",
				  idCardNumber: "",
				  socialCard: "",
				},
				rules:{
					idCardNumber: [
					    {validator: validatePass, trigger: 'blur' }
					],
					sex: [
					    {validator: ck, trigger: 'blur' }
					],
				}
			};
		},
	  methods: {
		submit() {
		  this.$refs.editForms.validate(valid => {
		    if (valid) {
		     forget(this.forms)
		         .then(r => {
		           this.$message({
		             message: r.msg,
		             type: r.status
		           });
				   this.$parent.selectuser();
				   this.openDialog()
				   this.$parent.showEditDialog = false;
		         })
		        .catch(() => {});
		    } else {
		      this.$message({
		        message: "请按照提示正确填写内容！",
		        type: "warning"
		      });
		      return false;
		    }
		  });
		},
	    openDialog() {
			
			queryUserInfo({
				userNo:getUserInfo().userNo
			}).then(r=>{
				this.forms=r;
				if(this.forms.idCardNumber!= null ){
					this.val=true
				}
				console.log(this.forms.idCardNumber+'lll')
			}).catch(r=>{})
	    	
	    },
	  },
	  
	}
</script>

<style>
	
</style>
