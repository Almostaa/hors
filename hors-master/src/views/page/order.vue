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
		<p v-if="douser.room && douser.room.roomname">科室：{{douser.room.roomname}}</p><br />
		<p v-if="douser.doctor && douser.doctor.dname" v-model="douser.doctor.dno">医生：{{douser.doctor.dname}}</p><br />
		<p v-model="datell[id]">预约时间：{{datell[id]}} <span v-model="time">{{time}}</span></p><br />
		<p v-model="forms.userNo">挂号人：{{forms.userName}}</p><br />
		<p v-model="douser.fee">挂号费：{{douser.fee}}￥</p><br />
	</div>
	
	  <div slot="footer" class="dialog-footer">
	    <el-button @click="$emit('close')">取 消</el-button>
		<el-button type="primary" @click.native="toSaveOrderAndPay">去付钱</el-button>
	  </div>
	</el-dialog>
</template>

<script>
	import {queryUserInfo} from "../../api/user.js"
	import {insertOrder,saveOrderAndPay} from "../../api/charge.js"
	import {getDoctorInforList,updateOrder} from "../../api/charge.js"
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
		  showDialog: Boolean
		},
		data() {
			
			return {
				forms:[],
				datell:[],
				id:'',
				date_day:'',
				time:'',
				douser:{},
				apptNo:''
			};
		},
	created() {
		//this.getCurrentTime()
	},
	  methods: {
		toSaveOrderAndPay() {
			insertOrder({
				 dno:this.douser.doctor.dno,
				 apptDate:this.datell[this.id],
				 apptTime:this.time,
				 usno:this.forms.userNo,
				 price:this.douser.fee,
				 //createTime:this.YMD
			 }) 
		         .then(r => {
					 
				   console.log( r.totalCount)
				   this.apptNo=r.totalCount
				   console.log( this.apptNo)
				   
				   saveOrderAndPay({
				   	out_trade_no:this.apptNo,subject:"预约挂号",
				   	total_amount:this.douser.fee,
				   	body:this.douser.doctor.dname+this.douser.room.roomname})
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
			}).catch(r=>{})
	    	
	    },
		
		// new Date() 获取当前标准时间，转为：YYYY-MM-DD h:m:s (年月日:时分秒) 格式
		/* getCurrentTime () {
		  let date = new Date()
		  let Y = date.getFullYear()
		  let M = date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1)
		  let D = date.getDate() < 10 ? ('0' + date.getDate()) : date.getDate()
		  let hours = date.getHours()
		  let minutes = date.getMinutes() < 10 ? ('0' + date.getMinutes()) : date.getMinutes()
		  let seconds = date.getSeconds() < 10 ? ('0' + date.getSeconds()) : date.getSeconds()
		  date = Y + '-' + M + '-' + D + ' ' + hours + ':' + minutes + ':' + seconds
		  this.YMD=date;
		}*/
	  }, 
	  
	}
</script>

<style>
	
</style>
