<template>
  <div>
	  <div class="iii" v-for="i in list" :key="i.informationtypeno">
		<router-link :to="{ path: '/news/details', query: {pno:i.pno} }">
	  			<div class="img">
	  				<img :src="serviceImgURl+i.picture" />
	  			</div>
	  			<div class="lll">
	  				<h4>{{i.title}}</h4>
					<span style="text-indent: 2em;font-size: 14px;">作者：{{i.author}}   创建时间：{{i.createtime | formatTimeToStr}}</span>
	  				<p style="text-indent: 2em;">{{i.content}}</p>
	  			</div>
		</router-link>
	  	</div>
  </div>
</template>
<script>
	import { serverApiUrl } from "../config/apiUrl"
	import {formatTimeToStr} from "../config/date"; 
export default {
	filters:{
		    formatTimeToStr:function(time){
				return formatTimeToStr(time);
		    },
		 },
  name: "MyList",
  // list为父组件传过来的商品列表
  props: ["list"],
  data() {
    return {
		serviceImgURl: serverApiUrl+'/images/news/',
	};
  },
  methods: {
  }
};
</script>

<style>

	.iii{
		width: 1100px;
		height: 190px;
		/* margin-left: 200px; */
		border: solid 1px gray;
		overflow: hidden;
	}
	.img{
		width: 300px;
		float: left;
	}
	.img img{
		display: block;
		width: 100%;
	}
	.img img:hover{
		transform: scale(1.2);
	}
	.lll{
		float: right;
		width: 770px;
		color: #000000;
	}
	.lll p{
		overflow: hidden;
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 5;
	}
</style>