package com.sesame.config;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {

    //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016102400750910";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDZYcdx8/LRwc03EZMQNBXWXSk17daVFXWDfTqfoQNHbQLVv1Cl1jDtocWzGwNzPAwAiiYCFw7mKZHCKSYGEauLYFvDmsjLr3GXq4b2ttsztTrwMqQBqHV684iHWEdHfMKI8gNHooaq/qXr8CjEaZUwwV9T2JQ10nVXcwi0t6KBWA9+xjKCOig5NPt9DOAp+d9cEzx4uoAo7b+yavpUppvwmyg69rr+zJNfn07cButXnWoSjHQ/8374WNLBE7W4ZAplzBMP7niVdKQqBVZKLP9Oo47qGQ6VYaRIjDK3jA9AAoGMDqUTFmUYZAuyKLPEPXX97tP01h4Kcgv9EEgwxijjAgMBAAECggEABY5NNalhfGDyqMSnOJPMNxVcd0dj452PylOKCwhneAzeNK5WFlb6Gyi2T9SR6wEO4Ximbgk+1T0cv5SjpyYOd1p4HfC3zxTl11WH9ohH4/Nu1TLGJFC05/aPd74W3EnhAvUEhnEt9fLaNMSHljWInZ1jnVX8u79sRlbnUw8adSnJ7LnhjkJQLwsbyCybjGNFPICJdFalcv48QoFw++BSTyKXTHAEO/w+4lVhXT+taUwkAh4f9Sh3GcVtm1COqsQfCg0QM6/6+nOucyCc3hfUAlLIxjtygxxIZlkhTlZdBziCADtECO/j+gQj2yziavLRJ3q4xAWOJc2vBXiBrOYKEQKBgQD9W/x0/sAGAIl8fqs0vMhDkmNMoMyo4kFL4GKDjjVA76rp2fct+jVXrdpa3AMEsnZIFyPR4/Xy764FuYpitviOEhA88i68cdCCkK47jEDSgJDHFFs3wlo3HZvTtFQtptoIc/58vW1jfoFKhLxNDqW9sAeozFQ3JfjI55kKu1r6+QKBgQDbpcxLoSWzXGOJfwJ+zJdNQ9Z1Sca/VgFj9xCkbK52I36e0F4NtJWSaqkHxcdG73/iNcWMAIeryZ416gOYfxVQ5Te/Ybuo0NsqzGC74DRMRBgda6O+SQyynJFcMKk6w97FtF+Xak3t5kkskqPxW2I2MhsYZg0cBkazPeL3jP+9uwKBgQDsxFLYDt3qfgP9+O4MGcPZCeuMR9Uaml5FB0to/7OanJ8PbSdGq0XAS3L8aBDWCeTpl95cnnlQ71WkefDuMWl0c0MDgZvVdVNTQNviQD6vuYAS214nbJQcX6opHKNyCjRFpAiWD/wy95zhw8upA2A2NVPjFhg5dV3aejyWP+JVGQKBgQCbN+JUO8/xnUN2AfxYcOonHt5pyjYaNoQLCaiIGYl8UP8E6gjdNJVSf+9tX7XAijVcPVWZ5zH5EySrwvDBjmUY4rLvmvhLhzSqXP2rJviuQJyuBcgUC3leq0gJ1xVwQsSmAB5hWS0zBj8FsacLQ+H2nJgLOOrguAq0VfKTr992SwKBgEdsAmTKqytwqcPp+ONiR/C5PHUlsVz0DFnFXkuLML79SH0Ba6cW45Hm1QzECMiEM5ynkVdIAKcCFFrXahbpMFAEWiht+/15r92lNxWsLC/FIPkuFXY78U/ZZ/5tWX9g2jFj8RHKLwipoLhL8xoQbKewlXabWEmAX37u9R/MAnFI";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsrPyjg3WC+Nv1P+CqsQllhI29JaP7SPmRwOSsD/+70BJbrchEsnEYVcOFdKeitkkJiPeGA4EXxz8xr+Ybf4xCuXczYiejPyg1Ru0QxdWmHL0GhE1BFaEwAXXh2FKSMMYXFJ3W3E8yJCmNWPx64GIPXO0qhetxQ2l63/CS+hDRujRhEwWJkmeyVNM4+sWopSAXAdBe71oShsD97oC6lzxGKLKlb62yby/SsxM5WLebXkve6ENcIRK2WTLDCreEkoAJADWC3v9BlQEpSNuvfj0HWLdfnxA8iAPJGKl5YMV1T1fpDgnHmxzTiJYxg80kNGrC3Dlg8X2eJt2ifXv27m+wQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8088/apptInfo/notify";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8081/#/paysuccess";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
