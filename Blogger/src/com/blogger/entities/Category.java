package com.blogger.entities;

public class Category {
	private int catId;
	private String name;
	private String description;
	
	
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Category(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}


	public Category(int catId, String name, String description) {
		super();
		this.catId = catId;
		this.name = name;
		this.description = description;
	}


	public int getCatId() {
		return catId;
	}


	public void setCatId(int catId) {
		this.catId = catId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}

}
