<template>
	<div>
		<div id="top" class="top">
		  <div class="wrap">
		      <p class="call">888-888/888888电话预约</p>
		      <p class="welcome" v-if="token == null">欢迎来到多吃黑芝麻健康服务平台&nbsp;请&nbsp;&nbsp;
		          <a @click="login()" style="cursor:pointer">登录</a>&nbsp;|
		          <a @click="register()" style="cursor:pointer">注册</a>
		      </p>
		      <p class="welcome" v-else >欢迎来到多吃黑芝麻健康服务平台:{{usernumber}}
		      		<button @click="logout" type="button">退出登录</button>
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
		        <div class="link menu" @click="home()" style="cursor: pointer;">全部科室</div>
		        <a class="link" @click="problem()" style="cursor: pointer;">专家问诊</a>
		        <a class="link" @click="news()" style="cursor: pointer;">健康资讯</a>
		        <a class="link" @click="user()" style="cursor: pointer;">个人中心</a>
		    </div>
		</div>
		<div>
			<img src="../../assets/logo.png" style="width: 400px;height: 380px;float: left;margin-left: 200px;">
		</div>
	<div id='texts' style="margin-left: 600px;margin-right: 200px;">
			<h3 style="text-align: center;margin: 8px 0px ;">医院简介</h3>
			<h5 style="list-style-type: circle;"></h5>
			<p>黑芝麻医院座落于澳门路凼中心地带上的澳门科技大学校园内。医院宗旨是希望能在舒适和愉快的环境下，
				以先进的医疗设备，为患者提供优质的中、西医医疗服务。医院为澳门科技大学医学院、中医药学院及药学院的临床带教基地，
				也是全澳唯一 一所具备大学支持的医院。本院住院部设有双人病房、私家病房及豪华病房，适合不同病患的需要。</p>
			<p>百余年来，我院拥有着一批国内的首创专业学科以及在我国率先开展的诊疗技术，如国内首创儿科教研室（1929）、
				泌尿外科（1946）、肾脏病专业(1950)、综合医院心血管病房(50年代)、儿科神经专业(1961)等；在国内率先开展改进静脉麻醉（1951）、
				先心手术（50年代）、肾移植（1960）、引进人工晶体植入术（1983）、冠心病介入性治疗(1986)、第一台自体血液回收机（1997）、
				微创切口肺移植（2005）、经皮心室重建术（2013）等，为我国的医学事业作出了卓越的贡献。</p>
			<p>随着国家医药卫生体制改革的不断推进，作为“国家队”的北大医院也紧跟时代步伐，
				“顺应医改、精细管理”，竭尽全力改善医疗卫生环境和方便人民群众就医。全体北大医院职工也将“不忘初心，
				牢记使命，不懈奋斗，走向卓越”，构建和谐医患环境、助力健康中国建设。</p>
		</div>		
		<div style="height: 60px;"></div>
		<div style="height: 50px;width: 100%;position: fixed;bottom: 0;text-align: center;background-color: #aaaa7f;">
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

import {getToken,getUserInfo} from "../../utils/common.js"
  export default {
    data() {
      return {
		userName:'login',
		usernumber:'',
		token:null,
      };
    },
	created() {
		this.token = getToken()
		this.usernumber=getUserInfo().phoneNumber
	},
    methods: {
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
	  logout() {
	  	localStorage.clear();
	  	this.$router.push('/')
	  },
    }
  }
</script>

<style>
	#texts p{
		text-indent: 2em;
		text-align: justify;
		font-family: "montserrat",sans-serif;
		color: #5E5E5E;				
	}
	.title{
		color: #0000FF;
		margin-left: 150px;
	}
	.box{
			text-align: center;
			padding: 30px;
			background:  #ffffff;
		}
	
</style>
