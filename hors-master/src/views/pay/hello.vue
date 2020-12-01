<template>
	<el-dialog
	  @opened="openDialog"
	  :width="dialogWidth"
	  :title="title"  style="text-align: center;"
	  :visible.sync="showDialog"
	  :show-close="false"
	  :close-on-click-modal="false"
	>
	
	<div style="text-align: left;">
		<p>科室：{{room.roomname}}</p><br />
		<p v-model="doctorlist.dno">医生：{{doctorlist.dname}}</p><br />
		<p v-model="forms.userNo">问诊人：{{forms.userName}}</p><br />
		<p v-model="douser.fee">门诊费：{{douser.fee}}￥</p><br />
	</div>
	
	  <div slot="footer" class="dialog-footer">
	    <el-button @click="$emit('close')">取 消</el-button>
		<el-button type="primary" @click.native="toSaveOrderAndPay">去付钱</el-button>
	  </div>
	</el-dialog>
</template>

<script>
	import {getUserInfo} from "../../utils/common.js"
	import {getDoctorinquiryFee,saveOrderAndPayC,insertOrderC} from "../../api/charge.js"
	import {queryUserInfo} from "../../api/user.js"
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
		  showDialog: Boolean
		},
		data() {
			
			return {
				douser:[],
				room:[],
				doctorlist:[],
				forms:[],
				consultNo:'',
			};
		},
	created() {
		//this.getCurrentTime()
	},
	  methods: {
		toSaveOrderAndPay() {
			insertOrderC({
				 dno:this.doctorlist.dno,
				 usno:this.forms.userNo,
				 price:this.douser.fee,
			 }) 
		         .then(r => {
					 
				   console.log( r.totalCount)
				   this.consultNo=r.totalCount
				   console.log( this.consultNo)
				   
				   saveOrderAndPayC({
				   	out_trade_no:this.consultNo,subject:"门诊",
				   	total_amount:this.douser.fee,
				   	body:this.doctorlist.dname+this.room.roomname})
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
				   		this.$parent.showDialog = false;
				   })
				   .catch(() => {});
				   
		         })
		     .catch(() => {});
			
			
		   
		},
	    openDialog() {
			getDoctorinquiryFee({id:this.$parent.id})
			.then(n=>{
				this.douser=n,
				this.room=n.room,
				this.doctorlist = n.doctor
				this.$parent.id=null;		
			})
			.catch(()=>{})
			
			queryUserInfo({
				userNo:getUserInfo().userNo
			}).then(r=>{
				this.forms=r;
			}).catch(r=>{})
	    	
	    },
	
	  }, 
	  
	}
</script>

<style>
	
</style>
