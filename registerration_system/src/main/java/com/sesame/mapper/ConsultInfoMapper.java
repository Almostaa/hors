package com.sesame.mapper;

import com.sesame.pojo.ConsultInfo;

import java.util.List;

public interface ConsultInfoMapper {
    /*根据用户id查询所有问诊记录*/
    List<ConsultInfo> getConsultInfoListByUserId(Integer usno);


    /*
     * @author sfda
     * 确认订单后插入数据
     * */
    Integer insertOrder(ConsultInfo consultInfo);

    /*
     * @author sfda
     * 支付成功后更新状态码
     * */

    Integer updateOrder(Integer id);


    /*
     * @author sfda
     * 根据门诊编号查询支付状态码
     * */

    ConsultInfo getConsultInfoState(Integer id);

    /*
     * @author sfda
     * 退出咨询页面更新结束时间
     * */
    Integer updateDate(Integer id);
}
