import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import elementUi from "element-ui"
import axios from 'axios' 
import 'element-ui/lib/theme-chalk/index.css'

Vue.config.productionTip = false
Vue.use(elementUi);
Vue.prototype.$axios= axios ;

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
  str = str.toString().replace(/^([^\x00-\xff])([^\x00-\xff]{0,})([^\x00-\xff])/g , '$1*$3')
  return str;
})

/**
 * 匹配身份证号码
 * 555555555555555555 => 王*女
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
