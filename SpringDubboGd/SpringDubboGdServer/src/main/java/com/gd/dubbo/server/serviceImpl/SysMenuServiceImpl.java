package com.gd.dubbo.server.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.dubbo.api.pojo.SysMenuBean;
import com.gd.dubbo.api.service.SysMenuService;
import com.gd.dubbo.server.mapper.SysMenuMapper;

@Service
public class SysMenuServiceImpl implements SysMenuService {

	@Autowired
	private SysMenuMapper sysMenuMapper;
	
	@Override
	public List<SysMenuBean> getList(SysMenuBean bean) {
		List<SysMenuBean> select = sysMenuMapper.select(bean);
		return select;
	}

	@Override
	public List<SysMenuBean> getListPage(Long parentId) {
		SysMenuBean bean = new SysMenuBean();
		bean.setParentId(parentId);
		List<SysMenuBean> select = sysMenuMapper.select(bean);
		return select;
	}

	@Override
	public SysMenuBean getBean(SysMenuBean bean) {
		SysMenuBean selectOne = sysMenuMapper.selectOne(bean);
		return selectOne;
	}

}
