var ioc = {
    config : {
        type : "org.nutz.ioc.impl.PropertiesProxy",
        fields : {
            paths : ["custom/"]
        }
    },
    dataSource : {
        type : "com.alibaba.druid.pool.DruidDataSource",
        events : {
            create : "init",
            depose : 'close'
        },
        fields : {
            url : {java:"$config.get('db.url')"},
            username : {java:"$config.get('db.username')"},
            password : {java:"$config.get('db.password')"},
            testWhileIdle : true,
            validationQuery : {java:"$config.get('db.validationQuery')"},
            maxActive : {java:"$config.get('db.maxActive')"},
            filters : "mergeStat",
            connectionProperties : "druid.stat.slowSqlMillis=2000"
        }
    },
    dao : {
        type : "org.nutz.dao.impl.NutDao", // 1.b.53或以上版本使用原版NutDao.
        args : [{refer:"dataSource"}],
        fields : {
            executor : {refer:"cacheExecutor"}
        }
    },
    cacheExecutor : {
        type : "org.nutz.plugins.cache.dao.CachedNutDaoExecutor",
        fields : {
            cacheProvider : {refer:"cacheProvider"},
            // 需要缓存的表名
            cachedTableNames : [
                //"t_user_profile",
                //"t_user", "t_role", "t_permission", "t_role_permission"
            ]
        }
    },
    // 基于Ehcache的DaoCacheProvider
    cacheProvider : {
        type : "org.nutz.plugins.cache.dao.impl.provider.EhcacheDaoCacheProvider",
        fields : {
            cacheManager : {refer:"cacheManager"} // 引用ehcache.js中定义的CacheManager
        },
        events : {
            create : "init"
        }
    }
};