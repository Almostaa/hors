<template>
	<el-dialog
	  @opened="openDialog"
	  :width="dialogWidth"
	  :title="title"  style="text-align: center;"
	  :visible.sync="showEditDialog"
	  :show-close="false"
	  :close-on-click-modal="false"
	>
	
	<div style="text-align: left;">
		<p v-if="douser.room && douser.room.roomname">科室：{{douser.room.roomname}}</p><br />
		<p v-if="douser.doctor && douser.doctor.dname">医生：{{douser.doctor.dname}}</p><br />
		<p>预约时间：{{datell[id]}} {{time}}</p><br />
		<p>挂号人：{{forms.userName}}</p><br />
		<p>挂号费：{{douser.fee}}￥</p><br />
		
	</div>
	  <div slot="footer" class="dialog-footer">
	    <el-button @click="$emit('close')">取 消</el-button>
		<el-button type="primary" @click="submit">去付钱</el-button>
	  </div>
	</el-dialog>
</template>

<script>
	import {queryUserInfo} from "../../api/user.js"
	import {getDoctorInforList} from "../../api/charge.js"
	import {getUserInfo} from "../../utils/common.js"
	export default {
		props: {
		  title: {
		    type: String,
		    default: "订单页面",
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
			
			return {
				forms:[],
				datell:[],
				id:'',
				time:'',
				douser:{},
			};
		},
		created() {
			
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
			getDoctorInforList({id:this.$parent.doctorno})
				 .then(n=>{
					console.log(n)
					this.douser=n
					this.$route.query.id=null;
				 })
				 .catch(()=>{})
			
			
			this.id = this.$parent.p
			this.datell = this.$parent.dateoop
			this.time = this.$parent.time
			queryUserInfo({
				userNo:getUserInfo().userNo
			}).then(r=>{
				this.forms=r;
				if(this.forms.idCardNumber!=''){
					this.val=true
				}
				
			}).catch(r=>{})
	    	
	    },
	  },
	  
	}
</script>

<style>
	
</style>
