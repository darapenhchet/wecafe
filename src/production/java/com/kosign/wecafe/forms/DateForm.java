package com.kosign.wecafe.forms;

public class DateForm {
	
	private String  day;
	private String  week;
	private String  month;
	private String  year;

	private String startdate;
	
	private String enddate;

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Override
	public String toString() {
		return "DateForm [day=" + day + ", week=" + week + ", month=" + month + ", year=" + year + ", startdate="
				+ startdate + ", enddate=" + enddate + "]";
	} 
	
	
	
}
