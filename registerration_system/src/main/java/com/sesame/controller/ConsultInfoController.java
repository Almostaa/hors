package com.sesame.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.sesame.config.AlipayConfig;
import com.sesame.pojo.Apptinfo;
import com.sesame.pojo.ConsultInfo;
import com.sesame.pojo.PayInfo;
import com.sesame.service.ConsultInfoService;
import com.sesame.utils.RespBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/consultInfo")
public class ConsultInfoController {
    @Autowired
    private ConsultInfoService consultInfoService;

    @RequestMapping(value="/list" ,method= RequestMethod.GET)
     public List<ConsultInfo> getConsultInfoListByUserId(Integer usno){
        List<ConsultInfo> consultInfos=consultInfoService.getConsultInfoListByUserId(usno);
        /*for(int i=0;i<consultInfos.size();i++){
            if(consultInfos.get(i).getState().equals("1"))
                consultInfos.get(i).setState("已支付");
            else
                consultInfos.get(i).setState("未支付");

        }*/
      return consultInfos;
    }

    /*
     * @author sfda
     * 确认订单后插入数据
     * */

    @RequestMapping(value = "insertOrder",method = RequestMethod.GET)
    public RespBean insertOrder( Integer dno, Integer usno, Double  price){

        ConsultInfo consultInfo = new ConsultInfo();
        consultInfo.setPrice(price);
        consultInfo.setDno(dno);
        consultInfo.setUsno(usno);

        Integer userlist = consultInfoService.insertOrder(consultInfo);

        int apptNo = consultInfo.getConsultNo();

        System.out.println(apptNo);

        if (userlist > 0 ){
            return new RespBean("success", "添加成功!",apptNo);
        }else {
            return new RespBean("error", "添加失败!");
        }

    }

    @RequestMapping(value = "/toSaveAndPay",method = RequestMethod.POST,produces = "text/html; charset=UTF-8")
    private String toPay(@RequestBody PayInfo payInfo) throws Exception {
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl("http://localhost:8081/#/payConsultinfo");
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

    /*修改订单支付状态*/
    @RequestMapping(value = "updateOrder" )
    public Integer updateOrder(Integer apptNo) {

        int op = consultInfoService.updateOrder(apptNo);

        return op;
    }

    /*
     * @author sfda
     * 根据门诊编号查询支付状态码
     * */

    @RequestMapping(value = "getConsultInfoState" )
    public ConsultInfo getConsultInfoState(Integer consultNo){

        ConsultInfo No = consultInfoService.getConsultInfoState(consultNo);
        return No;
    }

    /*
     * @author sfda
     * 退出咨询页面更新结束时间
     * */

    @RequestMapping(value = "updateDate" )
    public Integer updateDate(Integer consultNo){

        Integer No = consultInfoService.updateDate(consultNo);
        return No;
    }


}
