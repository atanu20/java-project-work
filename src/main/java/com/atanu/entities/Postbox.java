package com.atanu.entities;

import java.sql.*;

public class Postbox {
	private int pid;
    private String ptitle;
    private String pdesc;
    private String pcode;
    private String pimage;
    private Timestamp pdate;
    private int catid;
    private int userid;

    
	public Postbox(int pid, String ptitle, String pdesc, String pcode, String pimage, Timestamp pdate, int catid,int userid) {
		super();
		this.pid = pid;
		this.ptitle = ptitle;
		this.pdesc = pdesc;
		this.pcode = pcode;
		this.pimage = pimage;
		this.pdate = pdate;
		this.catid = catid;
		this.userid = userid;
	}


	public Postbox() {
		super();
	}
    
	public Postbox( String ptitle, String pdesc, String pcode, String pimage, Timestamp pdate, int catid,int userid) {
		super();
		
		this.ptitle = ptitle;
		this.pdesc = pdesc;
		this.pcode = pcode;
		this.pimage = pimage;
		this.pdate = pdate;
		this.catid = catid;
		this.userid = userid;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getPtitle() {
		return ptitle;
	}


	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}


	public String getPdesc() {
		return pdesc;
	}


	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}


	public String getPcode() {
		return pcode;
	}


	public void setPcode(String pcode) {
		this.pcode = pcode;
	}


	public String getPimage() {
		return pimage;
	}


	public void setPimage(String pimage) {
		this.pimage = pimage;
	}


	public Timestamp getPdate() {
		return pdate;
	}


	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}


	public int getCatid() {
		return catid;
	}


	public void setCatid(int catid) {
		this.catid = catid;
	}


	public int getUserId() {
		return userid;
	}


	public void setUserId(int userid) {
		this.userid = userid;
	}
    
	
	
    
}
