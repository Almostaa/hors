<template>
	<el-dialog
	  @opened="openDialog"
	  :width="dialogWidth"
	  :title="title"  style="text-align: center;"
	  :visible.sync="showEditDialog"
	  :show-close="false"
	  :close-on-click-modal="false"
	>
	
	  <div>
		  <h4 style="text-align: left;">{{douser.rank}}{{douser.dname}}正在为您服务!窗口将在{{buttonText}}后自动关闭</h4>
		  <div id="app">
		          <div>
		              <li style="text-align: left;" v-for="item in message_array">{{item}}</li>
		          </div>
				  <el-input type="textarea" :rows="1" v-model="message" style="width: 300px;" />
		          <el-button v-on:click="dealMessage" type="primary">发送</el-button>
		  </div>
	  </div>
	  <div slot="footer" class="dialog-footer">
	    <el-button type="success" @click="close()" style="width: 100px;">咨询完毕！</el-button>
	  </div>
	</el-dialog>
</template>

<script>
	import {getDoctorInfor} from "../../api/doctor.js"
	export default {
		props: {
		  title: {
		    type: String,
		    default: "欢迎使用专家咨询功能！",
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
				douser:{},
				message_array:[],
				message:'',
				
				buttonText: '发送验证码',
				isDisabled: false, // 是否禁止点击发送验证码按钮
				flag:true,
			};
		},
		created() {
			let time = 300
			this.buttonText = '已发送'
			this.isDisabled = true
			if (this.flag) {
			  this.flag = false;
			  let timer = setInterval(() => {
			    time--;
			    this.buttonText = time + ' 秒'
			    if (time === 0) {
			      clearInterval(timer);
			      this.buttonText = '0'
				  this.$emit('close')
				  this.message_array=[]
			      this.isDisabled = false
			      this.flag = true;
			    }
			  }, 1000)
			}
		},
	  methods: {
		dealMessage: function () {
             this.message_array.push(this.message);
             this.message = '';
         },
	    openDialog() {
			getDoctorInfor({id:this.$parent.id})
			.then(n=>{
				this.douser=n
				this.$parent.id=null;
			})
			.catch(()=>{})
	    },
		close(){
			this.$emit('close')
			this.message_array=[]
		}
	  },
	  
	}
</script>

<style>
	
</style>
