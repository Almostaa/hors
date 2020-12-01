<template>
  <div style="color: #FAFAFA;">
    <div style="text-align: center;margin-top: 100px;">
		<div >
			<a href="#" style="width:200px; height:200px;padding:9px 0;display: inline-block;">
				<img src="../../assets/home/timg.png" style="width:100%;height:100%;">
			</a>
		</div>
      <div style="font-size: 30px;color: #000000;">
        支付成功!
      </div>
	  <div style="font-size: 10px;color: #000000;">
	    <p style="color: #0055FF;">{{buttonText}}</p>后自动跳转咨询页面
	  </div>
      <div class="bullshit">
		<div style="color: #0086F1;border: 0;padding: 20px;">
			<el-button @click="home()" style="color: #0055FF;">开始咨询</el-button>
		</div>
      </div>
    </div>
  </div>
</template>

<script>
	import {updateOrderC ,getConsultInfoState} from '../../api/charge.js'
export default {
 data() {
    return {
      out_trade_no:'',
	  buttonText: 5,
	  isDisabled: false, 
	  dno:'',
	  flag:true,
    };
  },
  mounted() {
      this.out_trade_no = this.$route.query.out_trade_no
	  
      console.log(this.$route.query.out_trade_no);
	 
	  updateOrderC({apptNo:this.out_trade_no})
	  .then(r => {
	  		console.log(r)
	      })
	  .catch(() => {});
	  
	  getConsultInfoState({consultNo:this.out_trade_no})
	  .then(n=>{
	  	console.log(n.dno+"==")
	  	 this.dno = n.dno
	  })
	  .catch(()=>{})
  },
  created() {
  	let time = 5
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
		 http://localhost/contorller/action/?Params1=a&Params2=b
		 this.$router.push({
		 	path:'/details',
		 	query:{
		 		id:this.dno,
				orderid :this.out_trade_no
		 	}
		 })
  	    }
  	  }, 1000)
  	}
	
  },
  methods:{
	  home(){
	    this.$router.push({
	    	path:'/details',
	    	query:{
	    		id:this.dno,
	    		orderid :this.out_trade_no
	    	}
	    })
	  },
  }
}
</script>
