<template>
	<el-dialog
	  @opened="openDialog"
	  :width="dialogWidth"
	  :title="title"  style="text-align: center;"
	  :visible.sync="showEditDialog"
	  :show-close="false"
	  :close-on-click-modal="false"
	>
	 <el-form :model="forms" :rules="rules"  ref="editForms" class="edit-forms" label-position="left" :label-width="labelWidth">
	   <el-form-item label="姓名:" prop="name" required>
	     <el-input v-model="forms.name"></el-input>
	   </el-form-item>
	 		  <el-form-item label="性别:" prop="typeid" required>
	 			<el-input v-model="forms.sex"></el-input>
	 		  </el-form-item> 
	   <el-form-item label="手机号:" prop="price" required>
	     <el-input v-model="forms.price" disabled></el-input>
	   </el-form-item>
	   <el-form-item label="身份证号:" prop="goodsdesc" required>
	     <el-input v-model="forms.goodsdesc"></el-input>
	   </el-form-item>
	 		<el-form-item label="社保卡号:" prop="url" required>
	 		  <el-input v-model="forms.url"></el-input>
	 		</el-form-item>
	 </el-form>
	  <div slot="footer" class="dialog-footer">
	    <el-button @click="$emit('close')">取 消</el-button>
	    <el-button type="primary" 
		 
		 @click="submit">确认</el-button><!-- :disabled="(registerForm.name && registerForm.password && registerForm.phone )" -->
	  </div>
	</el-dialog>
</template>

<script>
	export default {
		props: {
		  title: {
		    type: String,
		    default: "请填写本人真实信息",
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
			
			return {
				val:[],
						forms: {
				  name: "",
				  typeid: "",
				  price: "",
				  goodsdesc: "",
				  url: "",
				},
				fileList: [],
				
				rules:{
					goodsdesc: [
					    {validator: validatePass, trigger: 'blur' }
					],
				}
			};
		},
	  methods: {
		submit() {
		  this.$refs.editForms.validate(valid => {
		    if (valid) {
		      this.$message({
		        message: "字段验证通过，提交请求，成功后刷新分页！",
		        type: "success"
		      });
		   /*   this.$emit("success"); //通知列表分页刷新 */
		     savegoods(this.forms)
		         .then(r => {
		           this.$message({
		             message: r.msg,
		             type: "success"
		           });
		           //this.$emit("success");
				   this.$parent.refresh();
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
	    	
	    },
	  },
	  
	}
</script>

<style>
	
</style>
