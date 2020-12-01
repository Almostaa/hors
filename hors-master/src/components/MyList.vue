<template>
  <div>
	  <div class="ooo" v-for="i in list">
		<router-link :to="{ path: '/newsdetails', query: {id:i.pno} }">
	  			<div class="imgqq">
	  				<img :src="serviceImgURl+i.picture" />
	  			</div>
	  			<div class="lll" >
	  				<h4 style="padding: 8px;">{{i.title}}</h4>
					<span style="text-indent: 2em;font-size: 14px;">作者：{{i.author}}   创建时间：{{i.createtime}}</span>
	  				<p style="text-indent: 2em;text-align: justify;">{{i.content}}</p>
	  			</div>
		</router-link>
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
		serviceImgURl: serverApiUrl+'/images/information/',
	};
  },
  methods: {
  }
};
</script>

<style>

	.ooo{
		width: 1100px;
		height: 190px;
		margin-bottom: 10px;
		/* margin-left: 200px; */
		border: solid 1px gray;
		overflow: hidden;
	}
	.imgqq{
		width: 300px;
		float: left;
	}
	.imgqq img{
		display: block;
		width: 100%;
	}
	.imgqq img:hover{
		transform: scale(1.2);
	}
	.lll{
		float: right;
		width: 770px;
		color: #5E5E5E;
		margin-right: 12px;
		font-family: "montserrat",sans-serif;
	}
	.lll p{
		overflow: hidden;
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 5;
	}
</style>