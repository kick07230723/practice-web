package com.nuritelecom.domain;

public class Criteria {
	private int skip;
	private int page;
	private int pageNum;
	private String keyword;
	private String type;

	public Criteria() {
		page = 1;
		pageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page < 0) {
			this.page = 1;
		}
		this.page = page;
	}

	public int getPageNum() {
		if (this.pageNum < 0 || this.pageNum > 100) {
			this.pageNum = 10;
		}
		return this.pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPageStart() {

		return (this.page - 1) * this.pageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageNum=" + pageNum + ", keyword=" + keyword + ", type=" + type + "]";
	}
}
