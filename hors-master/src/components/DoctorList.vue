<template>
  <div>
	  <div class="single-member effect-3" style="margin-left: 110px;margin-right: 100px;">
	  	<el-row >
	  	  <el-col :span="6" v-for="(d,o) in list" :key="o" style="padding: 40px;">
			<router-link :to="{ path: '/details', query: {id:d.doctor.dno} }" >
				<el-card :body-style="{ padding: '0px' }" style="cursor: pointer;">
				  <img :src="serviceImgURl+d.doctor.picture" class="image">
				  <div style="padding: 4px;">
					<span>{{d.doctor.dname}}</span>
					<div>
						<p style="text-indent: 2em;font-size: 5px;">{{d.doctor.rank}}</p>
					</div>
					<div class="bottom clearfix">
					  <time class="time">{{d.doctor.describe}}</time>
					  <el-button type="text" class="button">查看详情</el-button>
					</div>
				  </div>
				</el-card>
			 </router-link>
	  	  </el-col>
	  	</el-row>
	 
	  </div>
	  
  </div>
</template>
<script>
	import { serverApiUrl } from "../config/apiUrl"
	
export default {

  name: "MyList",
  // list为父组件传过来的商品列表
  props: ["list"],
  data() {
    return {
		serviceImgURl: serverApiUrl+'/images/doctor/',
		
	};
  },
  methods: {
	  
  },
  
};
</script>

<style>
  .time {
	overflow: hidden;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
    font-size: 13px;
    color: #999;
	
  }
  .button {
    padding: 0;
    float: right;
	padding-right: 10px;
  }

  .image {
    width: 210px;
	height: 180px;
    display: block;
  }

  .clearfix:before,
  .clearfix:after {
      display: table;
      content: "";
  }
  
  .clearfix:after {
      clear: both
  }
</style>