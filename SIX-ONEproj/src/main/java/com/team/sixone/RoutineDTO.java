package com.team.sixone;

import java.sql.Date;
import java.util.List;

public class RoutineDTO {
   private String routine_no;
   private String routine_name;
   private Date create_at;
   private String id;
   private String name;
   private String no;
	private String exe_name;
	private String exe_no;
	private String rou_no;
	private String count;
	private String set;
	private String days;
	private List list;
   
   
   
 

   
@Override
	public String toString() {
		return "RoutineDTO [routine_no=" + routine_no + ", routine_name=" + routine_name + ", create_at=" + create_at
				+ ", id=" + id + ", name=" + name + ", no=" + no + ", exe_name=" + exe_name + ", exe_no=" + exe_no
				+ ", rou_no=" + rou_no + ", count=" + count + ", set=" + set + ", days=" + days + ", list=" + list
				+ "]";
	}


public List getList() {
	return list;
}


public void setList(List list) {
	this.list = list;
}


public RoutineDTO(){}
   
   public String getExe_name() {
		return exe_name;
	}


	public void setExe_name(String exe_name) {
		this.exe_name = exe_name;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getExe_no() {
		return exe_no;
	}
	public void setExe_no(String exe_no) {
		this.exe_no = exe_no;
	}
	public String getRou_no() {
		return rou_no;
	}
	public void setRou_no(String rou_no) {
		this.rou_no = rou_no;
	}
	public String getSet() {
		return set;
	}
	public void setSet(String set) {
		this.set = set;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
   
   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getRoutine_no() {
      return routine_no;
   }
   public void setRoutine_no(String routine_no) {
      this.routine_no = routine_no;
   }
   public String getRoutine_name() {
      return routine_name;
   }
   public void setRoutine_name(String routine_name) {
      this.routine_name = routine_name;
   }
   public Date getCreate_at() {
      return create_at;
   }
   public void setCreate_at(Date create_at) {
      this.create_at = create_at;
   }
   public RoutineDTO(String routine_no, String routine_name, Date create_at,String id,String name) {
      this.name=name;
      this.routine_no = routine_no;
      this.routine_name = routine_name;
      this.create_at = create_at;
      this.id=id;
   }
   
   
   
   
   
   
   
   
   
   
}
