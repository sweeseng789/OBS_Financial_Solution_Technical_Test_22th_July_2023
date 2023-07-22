package com.obssolution.model;

public class Department {
	private String _Name;
	public String Name() {return _Name;}
	
	private Student[] _Students;
	public Student[] Students() {return _Students;}
	
	public Department(String name, Student[] students) {
		_Name = name;
		_Students = students;
	}
}
