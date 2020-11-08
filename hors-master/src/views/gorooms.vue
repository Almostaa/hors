<template>
	<el-dialog
	  @opened="openDialog"
	  :width="dialogWidth"
	  :title="title"  style="text-align: center;"
	  :visible.sync="showEditDialog"
	  :show-close="false"
	  :close-on-click-modal="false"
	>
	
		<div class="keshi" v-for="i in roombyid">
			<a @click="depdoctor(i.roomno)">{{i.roomname}}</a>
		</div>
	
		<div slot="footer" class="dialog-footer">
			<el-button @click="$emit('close')">取 消</el-button>
		</div>
	</el-dialog>
</template>

<script>
	
	import {roomListById} from "../api/section.js"
	export default {
		props: {
		  title: {
		    type: String,
		    default: "请选择科室",
		  },
		  dialogWidth: {
		    type: String,
		    default: "450px"
		  },
		  labelWidth: {
		    type: String,
		    default: "90px"
		  },
		  showEditDialog: Boolean
		},
		data() {
			return {
				roombyid: [],
			};
		},
	  methods: {
	    openDialog() {
			console.log(this.$parent.id)
	    	roomListById({id: this.$parent.id})
	    		.then(r => {
					this.roombyid = r
	    			/* this.FillerFormField(this.$parent.id , r); */
	    			this.$parent.id=null;
	    		})
	    		.catch(() => {}); 
	    },
		
		depdoctor(id){
			console.log("wwww"+id);
			this.$router.push({
				name:'depdoctor',
				params:{
					id:id
				}
			})
		},
	  },
	  
	}
</script>

<style>
	.keshi{
		cursor: pointer;
		margin-bottom: 10px;
	}
	.keshi a:hover{
		color: #0055FF;
	}
	.dialog-footer{
		height: 20px;
	}
</style>
