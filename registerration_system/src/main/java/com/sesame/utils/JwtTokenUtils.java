package com.sesame.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.sesame.pojo.User;

/**
 * Token认证工具类
 * @author JChiang
 * @currentTime 2020年10月27日下午4:11:14
 */
public class JwtTokenUtils {
	
	//定义一个token密钥 用于解密
	private static final String TOKEN_KEY=UUID.randomUUID().toString();
	//设置token的过期时间
	private static final long EXPIRATION_DATE = 30*60*1000;
	
	/**
	 * 创建token并加密实现签名
	 * @param user
	 * @return
	 */
	public static String encryptionToken(User user) {
		
		String token="";
		//系统当前时间开始计算过期时间
		 Date date = new Date(System.currentTimeMillis()+EXPIRATION_DATE);
		 
		 //通过HMAC256加密密钥
		 Algorithm algorithm =Algorithm.HMAC256(TOKEN_KEY);
		 
		 //设置token的头部信息
		 Map<String,Object> headerClaims = new HashMap<String,Object>();
		 //添加头部参数
		 headerClaims.put("typ", "JWT");
		 headerClaims.put("alg", "HS256");
		 
		 try {
			token = JWT.create()
					.withHeader(headerClaims)
					.withClaim("PhoneNumber", user.getPhoneNumber())
					.withClaim("PassWord", user.getPassWord())
					.withExpiresAt(date)
					.sign(algorithm);
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return token;
	}
	
	/**
	 * 进行token验证--解密
	 * @param token
	 * @return
	 */
	public static boolean verify(String token){
       
        try {
            Algorithm algorithm = Algorithm.HMAC256(TOKEN_KEY);
            JWTVerifier verifier = JWT.require(algorithm).build();
            DecodedJWT jwt = verifier.verify(token);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return  false;
        }
    }

}
