package com.example.address.dao;

import java.util.List;

import com.example.address.vo.AddressVo;

public interface AddressBookDao {
	public List<AddressVo> getList();
	public int insert(AddressVo vo);
	public List<AddressVo> find(String keyword);
	public int delete(Long pk);
}
