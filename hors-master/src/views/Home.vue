<template>
	<div>
		<!-- 头标签 -->
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
		        <div class="link menu" @click="home()" style="cursor: pointer;">全部科室
		            <div class="menu-list ui-menu" style="overflow:scroll;">
		                <div class="ui-menu-item" v-for="o in offices" >
		                    <div class="ui-department clearfix" :id="o.sectionno" @click="goroom(o.sectionno)">
								{{o.sectionname}}
							</div>
		                </div>
		            </div>
				</div>
		       <a class="link" @click="problem()" style="cursor: pointer;">专家问诊</a>
		       <a class="link" @click="news()" style="cursor: pointer;">健康资讯</a>
		       <a class="link" @click="user()" style="cursor: pointer;">个人中心</a>
		    </div>
		</div>
		
		<div id="banner" class="banner">
			<!-- 轮播图 -->
			<div class="ui-slide-wrap" id="imgs">
				<el-carousel trigger="click" height="490px">
				    <el-carousel-item v-for="(item,i) in carouselList" :key="i">
				        <img :src="serviceImgURl+item.rotpicture" />
				    </el-carousel-item>
				</el-carousel>
				
			  <!-- <div>
			    <img :src="carouselList[currentIndex]">
			  </div>
			  <div class="page" v-if="this.carouselList.length > 1">
			    <ul>
			      <li @click="gotoPage(prevIndex)">&lt;</li>
			      <li v-for="(item,index) in carouselList" @click="gotoPage(index)"
						:class="{'current':currentIndex == index}">{{index+1}}</li>
			      <li @click="gotoPage(nextIndex)">&gt;</li>
			    </ul>
			  </div> -->
			</div>
		    <!-- 快速预约-->
			<div class="banner-search">
		        <div class="caption"><span class="text">快速预约</span></div>
		        <div class="form">
		            <div class="line">
						<!-- <el-autocomplete popper-class="my-autocomplete" v-model="rooms.roomsno" 
						:fetch-suggestions="querySearch" placeholder="请输入科室名称(选填)" 
							
						@select="handleSelect">
							<template slot-scope="{ item }">
								<div>
									<span>{{ item.roomname }}</span>
								</div>
							　 </template> 
						</el-autocomplete> -->
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
					<router-link :to="{path:'/fast', query:{id:options.dno}}">
						<el-button style="color:#fff;
							font-size: 14px;
							height:32px;
							width:108px;
							border: #ffffff;
							border-radius: 3px;
							background-color: #febd09;">快速查询</el-button>
					</router-link>
		        </div>
		    </div>
			<div class="banner-help">
			    <div class="caption"><span class="text">帮助中心</span></div>
			        <a @click="about()" class="link" style="cursor: pointer;">关于我们</a>
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

	import { serverApiUrl } from "../config/apiUrl" 
	import Edit from "./gorooms.vue";
	import {sectionlist ,roomList ,roomListById} from "../api/section.js"
	import {getDoctorList} from "../api/doctor.js"
	import {rotationlist} from "../api/rotation.js"
	import {getToken,getUserInfo} from "../utils/common.js"
	export default {
	  name: 'Home',
	  data() {
		return {
			usernumber:'',
			token:null,
			carouselList:[],//轮播图
			currentIndex: 1,   //默认显示图片
			timer: null ,   //定时器
			offices:[],
			rooms:[],
			options: [],
			keshiname: '',
			yishengname: '',
			showEditDialog: false,
			num:'',
			serviceImgURl: serverApiUrl+'/images/home/',
			
			imToken:this.$route.query.im,
			accid:this.$route.query.id,
		};
	  },
	  created() {
		this.getlist();
	
		this.token = getToken()
		this.usernumber=getUserInfo().phoneNumber
		//console.log(localStorage.getItem("USER_INFO"))
		// console.log(this.usernumber)
		// console.log(this.usernumber.userNo+'jjj')
	  },
	  mounted() {
		  //定时器
	  	this.timer = setInterval(() => {this.gotoPage(this.nextIndex)}, 2000);
		/* this.rooms = this.loadAll(); */
	  },
	  methods: {

		/* querySearch(queryString, cb) {
		      var rooms = this.rooms;
		      var results = queryString ? rooms.filter(this.createFilter(queryString)) : rooms;
		      // 调用 callback 返回建议列表的数据
		      cb(results);
		},
		createFilter(queryString) {
		      return (restaurant) => {
		        return (restaurant.roomname.toLowerCase().indexOf(queryString.toLowerCase()) > -1);
		      };
		},
		
		loadAll() {
		    // 获取科室 
		    roomList()
		    	.then(r=>{
		    		this.rooms=r;
		    	})
		    	.catch(()=>{})
		}, */
		
		// 将科室编号传值
		changeFenqiRate(id){
			  //console.log(id+'aaa')
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
		//从后端传参
		getlist(){
			/* 获取大类*/
			sectionlist()
				.then(m =>{
					this.offices = m
				})
				.catch(() => {}); 
				
			/* 获取轮播图图片*/
			rotationlist()
				.then(p=>{
					//console.log(p)
					this.carouselList=p;
				})
				.catch(()=>{})
			roomList()
				.then(r=>{
					this.rooms=r;
				})
				.catch(()=>{})
		},
		//实现退出系统返回到登录页
		logout() {
			localStorage.clear();
			this.token=null
			this.$router.push('/')
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
		/* fast(id){
			this.$router.push({
				name:'fast',
				params:{
					id:id
				}
			})
		}, */
		depdoctor(id){
			this.$router.push("/depdoctor")
		},
	    handleSelect(item) {
		    console.log(item);
		}
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
		  height: 420px;
          display: block;
      }
      /* #imgs .page {
          background: rgba(0,0,0,.5);
          position: absolute;
          right: 0;
          bottom: 0;
          width: 100%;
      }
      #imgs .page ul {
          float: right;
      } */
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