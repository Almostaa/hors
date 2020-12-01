import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
	
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/login',
    name: 'login',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: function () {
      return import(/* webpackChunkName: "login" */ '../views/login.vue')
    }
  },
  {
    path: '/register',
    name: 'register',
    component: function () {
      return import('../views/register.vue')
    }
  },
  {
    path: '/problem',
    name: 'problem',
    component: function () {
      return import('../views/home/problem.vue')
    }
  },
  {
    path: '/news',
    name: 'news',
    component: function () {
      return import('../views/home/news.vue')
    }
  },
  {
    path: '/user',
    name: 'user',
    component: function () {
      return import('../views/home/user.vue')
    }
  },
  
  {
    path: '/about',
    name: 'about',
    component: function () {
      return import('../views/home/about.vue')
    }
  },
  
  {
    path: '/forget',
    name: 'forget',
    component: function () {
      return import('../views/forget.vue')
    }
  },
  {
    path: '/fast',
    name: 'fast',
    component: function () {
      return import('../views/page/fast.vue')
    }
  },
  {
    path: '/depdoctor',
    name: 'depdoctor',
    component: function () {
      return import('../views/page/depdoctor.vue')
    }
  },
  
  {
    path: '/details',
    name: 'details',
    component: function () {
      return import('../views/page/details.vue')
    }
  },
  
 {
     path:'/paysuccess',
     name:'paysuccess',
     component: function () {
       return import('../views/pay/paysuccess.vue')
     }
   },
   
   {
       path:'/payConsultinfo',
       name:'payConsultinfo',
       component: function () {
         return import('../views/pay/payConsultinfo.vue')
       }
     },
  
]

const router = new VueRouter({
  routes
})

export default router
