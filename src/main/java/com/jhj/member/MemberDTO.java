package com.jhj.member;

public class MemberDTO {

	private String id;
	private String password;
	private String name;
	private String phone;
	private String address;
	private String join_date;
	private String kakao;
	private String facebook;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		if (name == null) {
			name = "";
		}
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		if (phone == null) {
			phone = "";
		}
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		if (address == null) {
			address = "";
		}
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getKakao() {
		if (kakao == null) {
			kakao = "";
		}
		return kakao;
	}

	public void setKakao(String kakao) {
		this.kakao = kakao;
	}

	public String getFacebook() {
		if (facebook == null) {
			facebook = "";
		}
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
}
