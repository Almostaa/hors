import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import elementUi from "element-ui"
import axios from 'axios' 
import Config from "@/config/app"
import 'element-ui/lib/theme-chalk/index.css'
import qs from 'qs'
import { getToken } from "@/utils/common";


Vue.prototype.$qs = qs
Vue.config.productionTip = false
Vue.use(elementUi)
Vue.prototype.GlobalCfg = Config
Vue.prototype.$axios= axios
Vue.prototype.$http = axios

router.beforeEach((to, from, next) => { 
  window.document.title = to.meta.title
    ? to.meta.title + "-" + Config.siteName
    : Config.siteName;
  const token = getToken()
  //const token = localStorage.getItem("token")
  if (token) {
    if(router.options.routes.length>3){
      next()
    }else{
      const asyncRouter = AsyncRouterMap.filter(function(k) {
        if (k.meta && k.meta.role && k.meta.role.indexOf(getUserInfo().role) >= 0) {
          return true;
        }
      });
      router.options.routes.unshift(...asyncRouter);
      router.addRoutes(asyncRouter);
      router.addRoutes([
        {
          path: "/404",
          component: () => import("@/views/page/404.vue")
        },
        {
          path: "*",
          redirect: "/404"
        }
      ]);  
      
      next({...to,replace:true})
    }
  } else {
    // 如果没有登录，访问非登录页面,则跳转到登录页面
    if (to.path !== '/') {
      if(to.path==='/user'){
        next({path: '/login'})
      }else{
        next()
      }
    } else {
      // 如果没有登录，但访问的进入是登录页面,直接进入
      next()
    }
  }
});


/**
 * 匹配电话号码
 * 15012341234 => 150****1234
 */
Vue.filter('phone', function (value) {
  if (!value) return '';
  let str = value;
  str = str.toString().replace(/^(\d{3})(\d{4})(\d{4})/g , '$1****$3')
  return str;
})

/**
 * 匹配名字
 * 王仙女 => 王*女
 */

Vue.filter('name', function (value) {
  if (!value) return '';
  let str = value;
  //str = str.toString().replace(/^([^\x00-\xff])([^\x00-\xff]{0,})([^\x00-\xff])/g , '$1*$3')
  str = new Array(str.length).join('*') + str.substr(-1);
  return str;
})

/**
 * 匹配身份证号码
 * 555555555555555555 => 
 */

Vue.filter('idcard', function (value) {
  if (!value) return '';
  let str = value;
  str = str.replace(/(\w{6})\w*(\w{4})/,'$1******$2')
  return str;
})

new Vue({
  router,
  store,
  render: function (h) { return h(App) }
}).$mount('#app')
