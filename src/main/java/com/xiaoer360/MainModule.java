package com.xiaoer360;

import org.nutz.mvc.annotation.*;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

/**
 * @功能说明：
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-06-08
 */
@SetupBy(value=MainSetup.class)
@Modules(scanPackage=true)
//ComboIocProvider的args参数, 星号开头的是类名或内置缩写,剩余的是各加载器的参数
//        *js 是JsonIocLoader,负责加载js/json结尾的ioc配置文件
//        *anno 是AnnotationIocLoader,负责处理注解式Ioc, 例如@IocBean
//*tx 是TransIocLoader,负责加载内置的事务拦截器定义, 1.b.52开始自带
@IocBy(type=ComboIocProvider.class, args={"*js", "ioc/",
        "*anno", "com.xiaoer360",
        "*tx"})
@ChainBy(args="mvc/xiaoer360-mvc-chain.js")
@Ok("json:full")
@Fail("jsp:views.error.500")
public class MainModule {
}
