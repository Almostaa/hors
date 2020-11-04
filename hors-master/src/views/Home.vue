<template>
	<div>
		<!-- 头标签 -->
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
		        <a href="#" class="logo"><img src="../assets/images/logo.jpg"></a>
		        <!-- <div class="search ui-search">
		            <div class="ui-search-selected">医院</div>
		            <input type="text" name="ui-search-input" class="ui-search-input" placeholder="请输入搜索内容">
		            <a @click="seacher()" href="#" class="ui-search-submit">&nbsp;</a>
		        </div> -->
		    </div>
		</div>
		
		
		
		<!-- 首页板块 -->
		<div id="nav" class="nav">
		    <div class="wrap">
		        <div class="link menu" @click="home()">全部科室
		            <div class="menu-list ui-menu" style="overflow:scroll;">
		                <div class="ui-menu-item" v-for="o in offices" >
		                    <div class="ui-department clearfix" :id="o.sectionno" @click="goroom(o.sectionno)">
								{{o.sectionname}}
								<!-- <div class="msg" v-for="v in roombyid">
									<a @click="depdoctor(id)">心脑血管科室</a>
									<a @click="depdoctor(id)">心脑血管科室</a>
									<a @click="depdoctor(id)">心脑血管科室</a>
									<a @click="depdoctor(id)">心脑血管科室</a>
								</div> -->
							</div>
							
							
		                    <!-- <div class="ui-menu-item-detail">
		                        <div class="ui-detail-group">
		                            <div class="ui-detail-group-list">
		                                <a href="#">心脑血管科室</a>
		                                <a href="#">神经内科</a>
		                                <a href="#">内分泌科室</a>
		                                <a href="#">血液科</a>
		                                <a href="#">心脑血管科室</a>
		                            </div>
		                        </div>
		                    </div> -->
		                </div>
		            </div>
				</div>
		       <a class="link" @click="problem()">专家问诊</a>
		       <a class="link" @click="news()">健康资讯</a>
		       <a class="link" @click="user()">个人中心</a>
		    </div>
		</div>
		
		<div id="banner" class="banner">
			<!-- 轮播图 -->
			<div class="ui-slide-wrap" id="imgs">
			  <div>
			    <img :src="carouselList[currentIndex]">
			  </div>
			  <div class="page" v-if="this.carouselList.length > 1">
			    <ul>
			      <li @click="gotoPage(prevIndex)">&lt;</li>
			      <li v-for="(item,index) in carouselList" @click="gotoPage(index)" :class="{'current':currentIndex == index}">  {{index+1}}</li>
			      <li @click="gotoPage(nextIndex)">&gt;</li>
			    </ul>
			  </div>
			</div>
		    <!-- 快速预约-->
			<div class="banner-search">
		        <div class="caption"><span class="text">快速预约</span></div>
		        <div class="form">
		            <div class="line">
						<select v-model="rooms.roomno" placeholder="选择室" @change="changeFenqiRate(rooms.roomno)">
						    <option
						      v-for="item in rooms"
						      :key="item.roomno"
						      :label="item.roomname"
						      :value="item.roomno">
						    </option>
						  </select>
					</div>
		            <div class="line">
						<select v-model="options.dno" placeholder="选择医生">
						    <option
						      v-for="item in options"
						      :key="item.dno"
						      :label="item.dname"
						      :value="item.dno">
						    </option>
						  </select>
					</div>
		        </div>
		        <div class="submit">
		            <el-button class="button" @click="fast()" 
					>快速查询</el-button>
		        </div>
		    </div>
			<div class="banner-help">
			    <div class="caption"><span class="text">帮助中心</span></div>
			        <a @click="about()" class="link">关于我们</a>
			        <a href="#" class="link">预约指南</a>
			        <a href="https://www.baidu.com/" class="link">友情链接</a>
			        <a href="#" class="link">常见问题</a>
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
			<Edit :showEditDialog="showEditDialog" @close="showEditDialog = false" />
	</div>
</template>

<script>
	import img1 from "../assets/home/1.png"
	import img2 from "../assets/home/2.png"
	import img3 from "../assets/home/3.png"
	import img4 from "../assets/home/4.png"
	
	
	import Edit from "./gorooms.vue";
	import {sectionlist ,roomList ,roomListById} from "../api/section.js"
	import {getDoctorList} from "../api/doctor.js"
	export default {
	  name: 'Home',
	  data() {
		return {
			carouselList:[img1,img2,img3,img4],//轮播图
			currentIndex: 0,   //默认显示图片
			timer: null ,   //定时器
			value:'',
			offices:[],
			rooms:[],
			roombyid:[],
			options: [],
			showEditDialog: false,
			num:'',
		};
	  },
	  created() {
		  /* 获取大类*/
	  	sectionlist()
	  		.then(m =>{
	  			this.offices = m
	  		})
	  		.catch(() => {}); 
		/* 获取科室 */
		roomList()
			.then(r=>{
				this.rooms=r;
			})
			.catch(()=>{})
	
	  },
	  mounted() {
		  //定时器
	  	this.timer = setInterval(() => {this.gotoPage(this.nextIndex)}, 2000)
	  },
	  methods: {
		
		// 将科室编号传值
		changeFenqiRate(id){
			  console.log(id+'aaa')
			  this.num=id
			  /* 根据科室编号获取科室下的医生 */
			  getDoctorList({id:this.num})
			  .then(n=>{
			  	this.options=n
			  })
			  .catch(()=>{})
		  },
		  /* 根据大类显示科室*/
		 goroom(id){
			 this.id = id;
			 this.showEditDialog = true
		 } ,
	    gotoPage(index) {
	      this.currentIndex = index;
	    },
		about(){
			this.$router.push("/about")
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
		fast(){
			this.$router.push("/fast")
		},
		depdoctor(id){
			this.$router.push("/depdoctor")
		},
	    
	  },
	  computed: {
		  
	    //上一张
	    prevIndex() {
	      if(this.currentIndex == 0) {
	        return this.carouselList.length - 1;
	      }else{
	        return this.currentIndex - 1;
	      }
	    },
	    //下一张
	    nextIndex() {
	      if(this.currentIndex == this.carouselList.length - 1) {
	        return 0;
	      }else {
	        return this.currentIndex + 1;
	      }
	    },
	  },
	  components: { Edit }
	}
</script>

<style>
	@import url("../style/css/common.css");
	@import url("../style/css/style.css");
	@import url("../style/css/ui.css");
	
</style>
<style>

      ul li {
          list-style: none;
          float: left;
          width: 30px;
          height: 35px;
          line-height: 40px;
          text-align: center;
          cursor: pointer;
          color: rgba(255,255,255,.8);
          font-size: 14px;
      }
      #imgs {
          max-width: 550px;
		  height: 413px;
          position: relative;
      }
      #imgs img {
          width: 100%;
		  height: 378px;
          display: block;
      }
      #imgs .page {
          background: rgba(0,0,0,.5);
          position: absolute;
          right: 0;
          bottom: 0;
          width: 100%;
      }
      #imgs .page ul {
          float: right;
      }
      .current {
          color: #ff6700;
      }

</style>
<style>
        *{
            margin: 0;
        }
        .ui-department{
            width: 130px;
            height: 40px;
            cursor: auto;
			color: #FFFFFF;
			cursor: pointer;
        }
		.ui-department:hover{
			color: #0055ff;
		}
        .ui-department .msg{
			text-align: left;
            display: none;
            width: 400px;
            height: 200px;
			margin-left: 92px;
            border: 1px solid #00ffff ;
            background:rgba(255,255,255,0.55);
            z-index: 2;
            position: relative;

        }
		.ui-department .msg a{
		    color: #000000;
			margin-right: 20px;
		}
        .ui-department .msg a:hover{
			color: #0086F1;
            cursor: pointer;
        }
        .clearfix:after{
			/* content:"0"; */
			display: block;
			clear: both;
			/* visibility: hidden; */
			height: 0;
        }
        .ui-department:hover .msg{
            display: block;
        }
    </style>
