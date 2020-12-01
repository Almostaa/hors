package com.sesame.mapper;

import com.sesame.pojo.Apptinfo;

import java.util.List;

public interface ApptinfoMapper {


    /*根据用户id查询所有挂号记录*/
    List<Apptinfo> selectALLByUserId(Integer usno);

    /*
    * @author sfda
    * 确认订单后插入数据
    * */

    Integer insertOrder(Apptinfo apptinfo);

    /*
     * @author sfda
     * 支付成功后更新状态码
     * */

    Integer updateOrder(Integer apptNo);

    /*
     * @author sfda
     * 查询订单
     * */

    List<Apptinfo> updateOrder();

}