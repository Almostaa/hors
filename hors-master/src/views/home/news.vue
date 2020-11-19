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
			<div style= "position:relative " class="aaaa"> 
				<div style= "position:absolute; left:200px; top: 350px; color:#000000; font-weight:bold ;z-index: 1;">
					<a href="" style="color: #000000;font-size: 20px;">
						{{newsid1.newstitle}}</a> 
				</div> 
				<a href=""><img :src="serviceImgURl+newsid1.newspicture" /></a> 
			</div>
			<div style= "position:relative " class="aaa">
				<div style= "position:absolute; left:610px; top: 160px; color:#000000; font-weight:bold;z-index: 1; ">
					<a href="" style="color: #000000;font-size: 15px;">
						{{newsid2.newstitle}}
					</a> 
				</div> 
				<a href=""><img :src="serviceImgURl+newsid2.newspicture" /></a> 
			</div>
			<div style= "position:relative " class="aa">
				<div style= "position:absolute; left:610px; top: 360px; color:#000000; font-weight:bold;z-index: 1; ">
					<a href="" style="color: #000000;font-size: 15px;">
						{{newsid3.newstitle}}
					</a> 
				</div> 
				<a href=""><img :src="serviceImgURl+newsid3.newspicture" /></a> 
			</div>
			<div style="margin-right: 30px;">
				<div class="new_list_con">
					<h3>
						<span>推荐热点</span>
						<a href="https://www.91huayi.com/news_index.html" style="font-size: 15px;margin-left: 270px;" >
							更多>>
						</a>
					</h3>
					<div>
						<li v-for="i in selectlist">
							<a href="">{{i.content}}</a>
							<span>{{i.createtime}}</span>
						</li>
					</div>
				</div>
			</div>
		</div>

		<div style="margin-top: 420px;margin-left: 100px;margin-right: 100px;">
		      <div style="color: #333333;">
		        <el-tabs v-model="activeName" type="card">
		          <el-tab-pane
		            v-for="item in categoryList"
		            :key="item.informationtypeno"
		            :label="item.informationtypename"
		            :name="''+item.informationtypeno"
		          />
		        </el-tabs>
		      </div>
			  
			  <!-- 主要内容区 -->
			  <div class="main">
			    <div class="list">
			      <MyList :list="product" v-if="product.length>0"></MyList>
			      <div v-else class="none-product">抱歉没有找到相关的资讯，请看看其他的分类</div>
			    </div>
			    <!-- 分页 -->
			    <div class="pagination">
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
	
	import {newsById , selectList} from "../../api/rotation.js"
	import { serverApiUrl } from "../../config/apiUrl" 
	import { infortypelist,inforlist} from "../../api/infor.js" 
	import MyList from "../../components/MyList.vue"
	import {getToken,getUserInfo} from "../../utils/common.js"
	export default {
	  data() {
	    return {
			categoryList:[],// 分类列表
			categoryID: [], // 分类id
			product: "", // 资讯列表
			
			total: null, // 总量
			pageSize: 3, // 每页显示的数量
			pageNo: 1, //当前页码
			activeName: "-1", // 分类列表当前选中的id
			
			newsid1:{},
			newsid2:{},
			newsid3:{},
			selectlist:[],
			serviceImgURl: serverApiUrl+'/images/news/',
			
			usernumber:'',
			token:null,
	    };
	  },
	  created() {
		  
		this.token =getToken()
		this.usernumber=getUserInfo().phoneNumber
		
		// 获取分类列表
		this.getCategory();
		// 获取数据
	  	this.getlist();
		
		// 如果路由没有传递参数，默认为显示全部资讯
		if (Object.keys(this.$route.query) == 0) {
		  this.categoryID = [];
		  this.activeName = "0";
		  return;
		}
		// 如果路由传递了categoryID，则显示对应的分类资讯
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
		  // 向后端请求分类列表数据
		  getCategory() {
			  infortypelist()
				  .then(res => {
					const val = {
					  informationtypeno: 0 ,
					  informationtypename: "全部"
					};
					const cate = res;
					cate.unshift(val);
					this.categoryList = cate;
				  })
				  .catch(err => {});
		  },
		  // 向后端请求全部资讯或分类资讯数据
		  getData() {
			console.log(this.pageNo)
		    // 如果分类列表为空则请求全部资讯数据，否则请求分类资讯数据
		    const api =
		      this.categoryID == 0
		        ? "http://localhost:8088/infor/inforlist?pageNo="+this.pageNo+"&pageSize="+this.pageSize
		        : "http://localhost:8088/infor/setinforbyid?ino="+this.categoryID+"&pageNo="+this.pageNo+"&pageSize="+this.pageSize
				this.$axios.get(api)
				  .then(res => {
					console.log(res)
					this.product = res.data.list;
					this.total = res.data.total;
				  })
				  .catch(err => {});
		  },
		  problem(){
			  this.$router.push('/problem')
		  },
		  logout() {
		  	localStorage.clear();
		  	this.$router.push('/')
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
		  getlist(){
			  newsById({id:1})
			  	.then(r=>{
			  		this.newsid1=r;
			  	})
			  	.catch(()=>{})
			  	
			  newsById({id:2})
			  	.then(r=>{
			  		this.newsid2=r;
			  	})
			  	.catch(()=>{})
			  	
			  newsById({id:3})
			  	.then(r=>{
			  		this.newsid3=r;
			  	})
			  	.catch(()=>{})
			  	
			  selectList()
			  	.then(r=>{
			  		this.selectlist=r;
			  	})
			  	.catch(()=>{})
		  },
		  login(){
		     this.$router.push("/login")
		  },
		  register(){
		  	this.$router.push("/register")
		  },
	  },
	  components:{MyList}
	}
</script>

<style>
	 .aaaa img{
		width: 500px;
		height: 400px; 
		position:absolute;
		top:26%;
		left: 100px;
		z-index: 0;
		
	} 
	.aaaa img:hover {
	    width: 500px;
	    height: 400px;
	    transform: scale(1.05, 1.05);
	 }
	.aaa img{
		width: 200px;
		height: 199px; 
		margin-left:610px;
		position:absolute;
		top:26%;
		z-index: 0;
	}
	.aaa img:hover {
	    width: 200px;
	    height: 199px;
	    transform: scale(1.1, 1.1);
	 }
	
	
	 .aa img{
		width: 200px;
		height: 199px; 
		margin-left:610px;
		position:absolute;
		margin-top: 200px;
		z-index: 0;
	}
	
	 .aa img:hover {
	     width: 200px;
	     height: 199px;
	     transform: scale(1.1, 1.1);
	  }
</style>
<style>
        .new_list_con{
			float: right;
            width: 480px;
            height: 390px;
            border: 1px solid #ddd;
            margin: 10px; 
			text-align: center;
            /*  多余的部分，进行裁剪 */
            overflow: hidden;
        }

        .new_list_con h3{           
            width: 450px;
            height: 50px;   
            /* 设置下划线 */
            border-bottom: 1px solid #ddd;
            /*  居中，对齐 */
            margin: 0 auto;

        }

        .new_list_con h3 span{
            /*  转换为内联块元素 */
            display: inline-block;
            height: 50px;
            border-bottom: 2px solid #0086F1;
            font: 18px/50px 'Microsoft Yahei';
            color: #000;
            /* 清除span的padding的上下属性 */
            padding:0 15px;
            position: relative;
        }

        .new_list_con div{
            /* 清除链接前面的“小圆点” */
            list-style: none;
            /* 清除ul的padding属性 */
            padding: 0;
            width: 450px;
            height: 238px;
            /*  设置左右间距 */
            margin: 7px auto 0;
        }

        .new_list_con div li{
            /*  设置每一行的行高，行宽由内容撑开 */
            height: 30px;
            /*  设置每一行的下划线 */
            /* border-bottom: 1px solid #ddd; */
        }

        .new_list_con div a{
            /*  向左浮动 */
            float: left;
            /*  设置字体大小，行宽，字号 */
            font: 14px/30px 'Microsoft Yahei';
            /*  清除下划线 */
            text-decoration: none;
            /*  设置字体颜色 */
            color: #000;
			width: 200px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			display: block;
        }

        .new_list_con div span{
            /*  日期，向右浮动 */
            float: right;
            /* 设置行宽 */
            height: 30px;
            /* 居中对齐 */
            line-height: 30px;
            color: #000;
        }

        .new_list_con div a:before{
            /* 在文字前面加“小圆点” */
            content: '· '
        }

        .new_list_con div a:hover{
            /* 触摸变色 */
            color: #0086F1;
        }

    </style>
	