<template>
	<div>
		<div id="top" class="top">
		  <div class="wrap">
		      <p class="call">888-888/888888电话预约</p>
		      <p class="welcome">欢迎来到多吃黑芝麻健康服务平台&nbsp;请&nbsp;&nbsp;
		          <a @click="login()" style="cursor:pointer">登录</a>&nbsp;|
		          <a @click="register()" style="cursor:pointer">注册</a>
		      </p>
		  </div>
		</div>
		<div id="header" class="header">
			<!-- 搜索框 -->
		    <div class="wrap">
		        <a href="#" class="logo"><img src="../../assets/images/logo.jpg"></a>
		    </div>
		</div>
		<div id="nav" class="nav">
		    <div class="wrap">
		        <div class="link menu" @click="home()">全部科室</div>
		        <a class="link" @click="problem()">专家问诊</a>
		        <a class="link" @click="news()">健康资讯</a>
		        <a class="link" @click="user()">个人中心</a>
		    </div>
		</div>
		
		
		<div style="margin-left: 183px;">
			<!-- 医生信息 -->
			<div class="iii">
				<div class="img">
					<img :src="douser.img" />
				</div>
				<div class="lll">
					<h4>{{douser.name}}</h4>
					<span style="font-size: 10px;">{{douser.currentDate}}</span>
					<p style="height: 10px;"></p>
					<p>简介：</p>
					<p style="text-indent: 2em;">{{douser.desc}}</p>
				</div>
			</div>
			
			<!-- 预约时间 -->
			<div>
			       <table class="altrowstable" id="alternatecolor" style="width: 852px;">
					 <thead>
						 <tr>
							<th scope="row" style="height: 30px;width: 100px;">日期</th>
						    <th v-for="(item,index) in same_week" :class="[same_day==item.date? 'activ' :'','dis']"   @click="select(item)" :key='index'>
								{{item.name}}
							</th>
					   </tr>
					 </thead>
					<tbody>
						<tr>
						    <th scope="row" style="height: 30px;">上午</th>
						    <td style="text-align: center;"><a>预约</a></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
						    <th scope="row" style="height: 30px;">下午</th>
						    <td style="text-align: center;"><a>预约</a></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
			       </table>
			</div>
			
		</div>
		<!-- 预约须知 -->
		<div>
			<div style="border-radius: 0px;border: 1px solid #ffff00;box-shadow: 0 0 25px #cac6c6;width: 200px; position:absolute;right:112px;top:24%;">
				<h2 style="border-bottom: 1px solid black;margin: 10px 10px ;">预约须知</h2>
				<p style="margin: 10px 10px;">① 身份信息必须与就诊者保持一致；</p>
				<p style="margin: 10px 10px;">② 取消预约截止时间为就诊前一日24点；</p>
				<p style="margin: 10px 10px;">③ 请比号源时间提前15分钟取号；</p>
				<p style="margin: 10px 10px;">④ 上午预约号取号截止时间为上午10时，下午预约号取号截止时间为下午3时；</p>
			</div>
		</div>
		
		
		<div style="height: 70px;width: 100%;position: fixed;bottom: 0;text-align: center;">
			<br />
			<p style="font-size:12px;text-align:center;">
				Copyright 2020 多吃黑芝麻.AllRightsReserved. 
			</p>
			<br />
			<p style="font-size:12px;text-align:center;">
				声明：所有信息和文章均来自互联网 如有异议 请与本站联系
			</p>
		</div> 
		
	</div>
</template>

<script>
	import img1 from "../../assets/home/3.png"
	import img2 from "../../assets/home/2.png"
	export default {
	  data() {
	    return {
			douser:{
				  img:img1, 
				  name:'zhzhzzhhz',
				  desc:'vvvvvvvvvvvvvv9999999999999999999999888888888888888888888888888888888888888888888888888888888999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999vv5iu',
				  currentDate:'2020-10-13'
			  },
			week:[],
			same_week:[],//保存当前最新的时间
			same_day:'',//当天的时间
	    };
	  },
	  created() {
	      // 默认显示当天前一周的数据
	      let data=[]
	      this.start=this.getDay(+7);
	      this.end=this.getDay();
	      for(let i=6;i>=0;i--){
	        data.push(this.getDay(+i))
	      }
	     var date=data.reverse()//得出一周的日期进行排序
	     this.week=date;
	     var date=this.week;
	     var pkc=[];/* 用于存储展示的日期数据 */
	     var weekday=["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
	     date.forEach((item,index)=>{//循坏日期
	        var f=new Date(item);
	        var week=f.getDay()//计算出星期几
	      var str1=item.split('/');
	      var strs=str1[1]+'/'+str1[2];
	  
	        var weeks=weekday[week]/* 将计算出来的时间带入数字得出中文 */
	        var time= Math.round(new Date(item) / 1000)//时间戳转换
	        var s={}//用于存储每个日期对象
	        s.date=item;
	        s.name=strs;
	        s.week=weeks;
	        s.times=time;
	        pkc.push(s)
	     })
	     this.same_week=pkc;
	     //pkc存储着今天的年月日星期几，时间戳等
	      this.same_day=pkc[0].date;//今天的数据
	    },
	  methods: {
		
		getDay(day){
		     　　var today = new Date();
		     　　var targetday_milliseconds=today.getTime() + 1000*60*60*24*day;
		     　　today.setTime(targetday_milliseconds); //注意，这行是关键代码
		     　　var tYear = today.getFullYear();
		     　　var tMonth = today.getMonth();
		     　　var tDate = today.getDate();
		     　　tMonth = this.doHandleMonth(tMonth + 1);
		     　　tDate =  this.doHandleMonth(tDate);
		     　　return tYear+"/"+tMonth+"/"+tDate;
		 },
		 doHandleMonth(month){
		     var m = month;
		     if(month.toString().length == 1){
		       　m =month;
		     }
		     return m;　
		 },
	    handleSelect(key, keyPath) {
	      console.log(key, keyPath);
	    },
		  problem(){
			  this.$router.push('/problem')
		  },
		  home(){
		  		  this.$router.push('/')
		  }, 
		  news(){
		  		  this.$router.push('/news')
		  },
		  user(){
			  this.$router.push("/user")
		  },
		  login(){
		     this.$router.push("/login")
		  },
		  register(){
		  	this.$router.push("/register")
		  },
	  }
	}
</script>

<style>

	.box{
			text-align: center;
			padding: 30px;
			background:  #ffffff;
		}

	.iii{
		width: 850px;
		height: 200px;
		/* margin-left: 200px; */
		border: solid 1px gray;
		overflow: hidden;
	}
	.img{
		width: 130px;
		float: left;
	}
	.img img{
		display: block;
		width: 100%;
		height: 200px;
	}
	.img img:hover{
		transform: scale(1.2);
	}
	.lll{
		float: right;
		width: 700px;
	}
	.lll p{
		overflow: hidden;
		word-break:break-all;
		width:600px; 
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 4;
	}
</style>
	
<style>
	table.altrowstable {
	    font-family: verdana,arial,sans-serif;
	    font-size:11px;
	    color:#333333;
	    border-width: 1px;
	    border-color: #a9c6c9;
	    border-collapse: collapse;
	}
	table.altrowstable th {
	    border-width: 1px;
	    padding: 8px;
	    border-style: solid;
	    border-color: #a9c6c9;
	}
	table.altrowstable td {
	    border-width: 1px;
	    padding: 8px;
	    border-style: solid;
	    border-color: #a9c6c9;
	}
	.oddrowcolor{
	    background-color:#d4e3e5;
	}
	.evenrowcolor{
	    background-color:#c3dde0;
	}
</style>
