package com.obssolution.model;

public class Student {
	private String _ID;
	public String ID() {return _ID;}
	
	private String _Name;
	public String Name() {return _Name;}
	
	private Integer _Mark;
	public Integer Mark() {return _Mark;}
	
	public Student(String id, String name, Integer mark) {
		_ID = id;
		_Name = name;
		_Mark = mark;
	}
}
