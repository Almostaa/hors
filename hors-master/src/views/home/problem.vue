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
		      <div style="color: #333333;">
					<el-tabs v-model="activeName" type="card">
					  <el-tab-pane
						v-for="item in categoryList"
						:key="item.sectionno"
						:label="item.sectionname"
						:name="''+item.sectionno"
					  />
					</el-tabs>
		      </div>
			  
			  <!-- 主要内容区 -->
			  <div class="main">
			    <div class="list">
			      <MyList :list="douser" v-if="douser.length>0"></MyList>
			      <div v-else class="none-product">抱歉没有找到相关的资讯，请看看其他的分类</div>
			    </div>
			    <!-- 分页 -->
			    <div>
			      <el-pagination
			        background
			        layout="prev, pager, next"
			        :page-size="pageSize"
					:current-page="pageNo"
			        :total="total"
			        @current-change="currentChange"
			      ></el-pagination>
			    </div>
			    <!-- 分页END -->
			  </div>
			  <!-- 主要内容区END -->
		</div>
		
		<div style="height: 70px;width: 100%;bottom: 0;text-align: center;">
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
	import {getToken,getUserInfo} from "../../utils/common.js"
	import { serverApiUrl } from "../../config/apiUrl" 
	import {sectionlist,selectdoctor} from "../../api/section.js"
	import MyList from "../../components/DoctorList.vue"
	export default {
	  data() {
	    return {
			usernumber:'',
			token:null,
			douser:[],//医生信息
			
			categoryList:[],//分类
			categoryID: [], // 分类id
			activeName:'-1',
			total: null, // 总量
			pageSize: 8, // 每页显示的数量
			pageNo: 1, //当前页码
			
			serviceImgURl: serverApiUrl+'/images/doctor/',
	    };
	  },
	  created() {
	  	this.token = getToken()
	  	this.usernumber=getUserInfo().phoneNumber
		
		this.gethomelist()
		
		// 如果路由没有传递参数，默认为显示全部
		if (Object.keys(this.$route.query) == 0) {
		  this.categoryID = [];
		  this.activeName = "0";
		  return;
		}
		// 如果路由传递了categoryID，则显示对应的分类
		if (this.$route.query.categoryID != undefined) {
		  this.categoryID = this.$route.query.categoryID;
		  if (this.categoryID.length == 1) {
		    this.activeName = "" + this.categoryID[0];
		  }
		  return;
		}
	  },
	  watch: {
	    // 监听点击了哪个分类标签，通过修改分类id，响应相应的资讯
	    activeName: function(val) {
	      if (val == 0) {
	  			this.pageNo = 1; //初始化当前页码为1
	        this.categoryID = [];
	      }
	      if (val > 0) {
	  			this.pageNo = 1; //初始化当前页码为1
	        this.categoryID = [Number(val)];
	      }
	    },
	    // 监听分类id，响应相应的资讯
	    categoryID: function() {
	      this.getData();
	    },
	  },
	  methods: {

			// 页码变化调用currentChange方法
			currentChange(v) {
				this.pageNo = v;
				//根据新的页面选取分页数据
				this.getData();
			},
			getData() {
			  // 如果分类列表为空则请求全部资讯数据，否则请求分类资讯数据
			  const api =
			    this.categoryID == 0
			      ? "http://localhost:8088/section/selectdoctorlist?pageNo="+this.pageNo+"&pageSize="+this.pageSize
			      : "http://localhost:8088/section/selectdoctor?sectionno="+this.categoryID+"&pageNo="+this.pageNo+"&pageSize="+this.pageSize
							this.$axios.get(api)
							  .then(res => {
								console.log(res)
								this.douser = res.data.list;
								this.total = res.data.total;
							  })
							  .catch(err => {});
			},
		gethomelist(){
			/* 获取大类*/
			sectionlist()
				.then(m =>{
					const val = {
					  sectionno: 0 ,
					  sectionname: "全部"
					};
					const cate = m;
					cate.unshift(val);
					this.categoryList = cate;
				})
				.catch(() => {});
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
		logout() {
			localStorage.clear();
			this.$router.push('/')
		},
		  
	  },
	  components:{MyList}
	}
</script>

