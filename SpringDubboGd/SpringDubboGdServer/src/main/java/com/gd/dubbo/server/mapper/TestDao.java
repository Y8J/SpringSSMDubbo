package com.gd.dubbo.server.mapper;

import java.util.List;
import java.util.Map;

import com.gd.dubbo.api.pojo.Test;

/**
 * 使用配置文件查询的dao
 * @author yangjing
 *
 */
public interface TestDao { 
 /**
  * 返回HashMap数据
  * @return
  */
 List<Map<Object,Object>> queryTestMap();
 /**
  * 返回实体数据
  * @return
  */
 List<Test> queryTestPojo();
}
