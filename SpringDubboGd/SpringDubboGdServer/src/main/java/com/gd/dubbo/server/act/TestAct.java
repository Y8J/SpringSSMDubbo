package com.gd.dubbo.server.act;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.dubbo.api.pojo.TestMapperBean;
import com.gd.dubbo.api.service.TestService;

@RequestMapping("user")
@Controller
public class TestAct {
	
	@Autowired
	private TestService testService;
	
	@ResponseBody
	@RequestMapping("list.do")
	public List<TestMapperBean> getUserList(HttpServletRequest request, HttpServletResponse response,
			                      ModelMap model,TestMapperBean test){
		List<TestMapperBean> list = testService.mapperQueryTestPojo();
		return list;
	}
}
