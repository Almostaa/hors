package com.sesame.controller;

import java.util.Date;
import java.util.Timer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.annotation.Schedules;
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.sesame.utils.CodeTimerTaskUtil;
import com.sesame.utils.CodeTimerUtil;

/**
 *  短信验证码登录
 * @author JChiang
 * @currentTime 2020年10月20日下午3:51:39
 */
@RestController
@RequestMapping("/sms")
public class AliyunSmsController {
	
	
    // 产品名称:云通信短信API产品,开发者无需替换
    static final String product = "Dysmsapi";
    // 产品域名,开发者无需替换
    static final String domain = "dysmsapi.aliyuncs.com";

    // TODO 此处需要替换成开发者自己的AK(在阿里云访问控制台寻找)
    static final String accessKeyId = "";
    static final String accessKeySecret = ""; // TODO 改这里

    public static SendSmsResponse sendSms(String telephone, String code) throws ClientException, com.aliyuncs.exceptions.ClientException {

        // 可自助调整超时时间
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        // 初始化acsClient,暂不支持region化
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);

        // 组装请求对象-具体描述见控制台-文档部分内容
        SendSmsRequest request = new SendSmsRequest();
        // 必填:待发送手机号
        request.setPhoneNumbers(telephone);
        // 必填:短信签名-可在短信控制台中找到
        request.setSignName("芝麻商城"); // TODO 改这里
        // 必填:短信模板-可在短信控制台中找到
        request.setTemplateCode("SMS_204465314");  // TODO 改这里
        // 可选:模板中的变量替换JSON串,如模板内容为"亲爱的用户,您的验证码为${code}"时,此处的值为
        request.setTemplateParam("{\"code\":\"" + code + "\"}");

        // 选填-上行短信扩展码(无特殊需求用户请忽略此字段)
        // request.setSmsUpExtendCode("90997");

        // 可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
        request.setOutId("yourOutId");

        // hint 此处可能会抛出异常，注意catch
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
        if (sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
            System.out.println("短信发送成功！");
        } else {
            System.out.println("短信发送失败！");
        }
        return sendSmsResponse;
    }
    
    
    private static String tel;
    
    @Resource
    private CodeTimerUtil codeTimerUtil;
 
   
    
    public static String getTel() {
    	
    	return tel;
    }
    

    // 以下为测试代码，随机生成验证码
    private static int newcode;
	// 随机生成的4位验证码
    public static int getNewcode() {
        return newcode;
    }
	// 4位随机数
    public static void setNewcode() {
        newcode = (int) (Math.random() * 9999) + 100;  //每次调用生成一次四位数的随机数
    }
    
	/**phone为测试接收验证码的手机号*/
    @RequestMapping("smsStudent")

    public void send(String phone,HttpServletRequest request) throws ClientException, com.aliyuncs.exceptions.ClientException {
        tel = phone;
    	setNewcode();
        String code = Integer.toString(getNewcode());
        SendSmsResponse sendSms = sendSms(phone, code);//填写你需要
        System.out.println("短信接口返回的数据----------------");
        System.out.println(code);
        System.out.println("Code=" + sendSms.getCode());
        System.out.println("Message=" + sendSms.getMessage());
        System.out.println("RequestId=" + sendSms.getRequestId());
        System.out.println("BizId=" + sendSms.getBizId());
    
        request.getServletContext().setAttribute(tel, code);
        //启动验证码定时清除任务
        codeTimerUtil.startupTimer();
    
 
       
    }   
    
    
    
}
