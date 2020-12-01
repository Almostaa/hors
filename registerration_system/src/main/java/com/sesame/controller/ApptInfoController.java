package com.sesame.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.sesame.config.AlipayConfig;
import com.sesame.pojo.Apptinfo;
import com.sesame.pojo.PayInfo;
import com.sesame.service.ApptInfoService;
import com.sesame.utils.RespBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/apptInfo")
public class ApptInfoController {

    @Autowired
    ApptInfoService apptInfoService;

    @RequestMapping(value="/list" ,method= RequestMethod.GET)
    public List<Apptinfo> selectALLByUserId(Integer usno){

        List<Apptinfo> apptInfos=apptInfoService.selectALLByUserId(usno);

        for(int i=0;i < apptInfos.size();i++){

           /* if(apptInfos.get(i).getState().equals("1")){
                apptInfos.get(i).setState("已支付");
            }else{
                apptInfos.get(i).setState("未支付");
            }*/


            String birthDays=apptInfos.get(i).getIdCardNumber().substring(6,14);
            String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
            Integer ageBit = Integer.parseInt(date) - Integer.parseInt(birthDays);
            if (ageBit.toString().length() > 4){
                //截取掉后四位即为年龄
                Integer personAge = Integer.parseInt(ageBit.toString().substring(0, ageBit.toString().length() - 4));
                apptInfos.get(i).setAge(personAge);
            }
            else {//当前年份出生，直接赋值为0岁
                apptInfos.get(i).setAge(0);
            }

        }
        return apptInfos;
    }

    /*
     * @author sfda
     * 确认订单后插入数据
     * */

    @RequestMapping(value = "insertOrder",method = RequestMethod.GET)
    public RespBean insertOrder(String apptTime, Integer dno, Integer usno,
                                @DateTimeFormat(pattern = "yyyy-MM-dd") Date apptDate, Double  price){

        //ResponseData responseData = null;

        Apptinfo apptinfo = new Apptinfo();
        apptinfo.setAppttime(apptTime);
        apptinfo.setDno(dno);
        apptinfo.setUsno(usno);
        apptinfo.setApptdate(apptDate);
        apptinfo.setPrice(price);

        Integer userlist = apptInfoService.insertOrder(apptinfo);

        int apptNo = apptinfo.getApptno();

        System.out.println(apptNo);

        if (userlist > 0 ){
            return new RespBean("success", "添加成功!",apptNo);
        }else {
            return new RespBean("error", "添加失败!");
        }



    }

    /*修改订单支付状态*/
    @RequestMapping(value = "updateOrder" )
    public Integer updateOrder(Integer apptNo) {

        int op = apptInfoService.updateOrder(apptNo);

        return op;
    }



    @RequestMapping(value = "/toSaveAndPay",method = RequestMethod.POST,produces = "text/html; charset=UTF-8")
    private String toPay(@RequestBody PayInfo payInfo) throws Exception {
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = new String(payInfo.getOut_trade_no().getBytes("ISO-8859-1"),"UTF-8");
        //付款金额，必填
        String total_amount = new String(payInfo.getTotal_amount().getBytes("ISO-8859-1"),"UTF-8");
        //订单名称，必填
        String subject = payInfo.getSubject();

        //商品描述，可空
        String body = payInfo.getBody();

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"timeout_express\":\"5m"+"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        System.out.println(alipayRequest.getBizContent());
        //输出
        return result;

    }



    @RequestMapping(value = "/notify",produces = "text/html; charset=UTF-8")
    private String notify(HttpServletRequest request) throws Exception {

        //获取支付宝POST过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }

        //调用SDK验证签名
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);


        if(signVerified) {//验证成功
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

            if(trade_status.equals("TRADE_FINISHED")){

            }else if (trade_status.equals("TRADE_SUCCESS")){

            }

            return "success" ;

        }else {//验证失败
            return "fail";

        }

    }

}
