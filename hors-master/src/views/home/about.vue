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
		        <div class="link menu" @click="home()" style="cursor: pointer;">全部科室</div>
		        <a class="link" @click="problem()" style="cursor: pointer;">专家问诊</a>
		        <a class="link" @click="news()" style="cursor: pointer;">健康资讯</a>
		        <a class="link" @click="user()" style="cursor: pointer;">个人中心</a>
		    </div>
		</div>
		<div>
			<img src="../../assets/logo.png" style="width: 400px;height: 380px;float: left;margin-left: 200px;">
		</div>
		<div style="margin-left: 600px;margin-right: 200px;">
			<h3 style="text-align: center;">医院简介</h3>
			<h5 style="list-style-type: circle;">上卷·六鱼</h5>
			<p style="text-indent: 2em;">羹对饭，柳对榆。短袖对长裾。鸡冠对凤尾，芍药对芙蕖。周有若，汉相如。王屋对匡庐。
			月明山寺远，风细水亭虚。壮士腰间三尺剑，男儿腹内五车书。疏影暗香，和靖孤山梅蕊放；轻阴清昼，渊明旧宅柳条舒。</p>
			<p style="text-indent: 2em;">吾对汝，尔对余。选授对升除。书箱对药柜，耒耜对耰锄。参虽鲁，回不愚。阀阅对阎闾。
			诸侯千乘国，命妇七香车。穿云采药闻仙人，踏雪寻梅策蹇驴。玉兔金乌，二气精灵为日月；洛龟河马，五行生克在图书。</p>
			<p style="text-indent: 2em;">欹对正，密对疏。囊橐对苞苴。罗浮对壶峤，水曲对山纡。骖鹤驾，侍鸾舆。桀溺对长沮。
			搏虎卞庄子，当熊冯婕妤。南阳高士吟梁父，西蜀才人赋子虚。三径风光，白石黄花供杖履；五湖烟景，青山绿水在樵渔。</p>
		</div>
		<div style="margin-left: 200px;margin-right: 200px;">
			<h5>上卷·七虞</h5>
			<p style="text-indent: 2em;">红对白，有对无。布谷对提壶。毛锥对羽扇，天阙对皇都。谢蝴蝶，郑鹧鸪。蹈海对归湖。
			花肥春雨润，竹瘦晚风疏。麦饭豆糜终创汉，莼羹胪脍竟归吴。琴调轻弹，杨柳月中潜去听；酒旗斜挂，杏花村里齐来沽。</p>
			<p style="text-indent: 2em;">罗对绮，茗对蔬。柏秀对松枯。中元对上巳，返璧对还珠。云梦泽，洞庭湖。玉烛对冰壶。
			苍头犀角带，绿鬓象牙梳。松阴白鹤声相应，镜里青鸾影不孤。竹户半开，对牖不知人在否？柴门深闭，停车还有客来无？</p>
			<p style="text-indent: 2em;">宾对主，婢对奴。宝鸭对金凫。升堂对入室，鼓瑟对投壶。觇合璧，颂联珠。提瓮对当垆。
			仰高红日近，望远白云孤。歆向秘书窥二酉，机云芳誉动三吴。祖饯三杯，老去常斟花下酒；荒田五亩，归来独荷月中锄。</p>
			<p style="text-indent: 2em;">君对父，魏对吴。北岳对西湖。菜蔬对茶荈，苣藤对菖蒲。梅花数，竹叶符。廷议对山呼。
			两都班固赋，八阵孔明图。田庆紫荆堂下茂，王裒青柏墓前枯。出塞中郎，羝有乳时归汉室；质秦太子，马生角日返燕都。</p>
		</div>
		<h4 style="color: #FFFFFF;">笠翁对韵</h4>
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

  export default {
    data() {
      return {
		userName:'login',
      };
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
    }
  }
</script>

<style>
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
