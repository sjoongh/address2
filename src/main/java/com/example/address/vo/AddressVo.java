package com.example.address.vo;

public class AddressVo {
	private Long no;
	private String name;
	private String hp;
	private String tel;
	private String keyword;
	
	public AddressVo() {
		
	}	
	
	public AddressVo(String keyword) {
		keyword=keyword;
	}
	public AddressVo(String name, String hp, String tel) {
		name = name;
		hp = hp;
		tel = tel;
	}
	
	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "AddressVo [name=" + name + ", hp=" + hp + ", tel=" + tel + "]";
	}
	
	
}
