package com.gd.dubbo.api.pojo;

import java.io.Serializable;


/**
 * mybatis xml配置使用bean
 * @author yangjing
 *
 */
public class Test implements Serializable {
	private Integer id;
	private String name;
	private String password;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	
}
