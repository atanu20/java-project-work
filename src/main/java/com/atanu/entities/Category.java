package com.atanu.entities;

public class Category {
	
	 private int cid;
	    private String ctitle;
		public Category(int cid, String ctitle) {
			super();
			this.cid = cid;
			this.ctitle = ctitle;
		}
		public Category() {
			super();
		}
		
		public Category( String ctitle) {
			super();
			
			this.ctitle = ctitle;
		}
		public int getCid() {
			return cid;
		}
		public void setCid(int cid) {
			this.cid = cid;
		}
		public String getCtitle() {
			return ctitle;
		}
		public void setCtitle(String ctitle) {
			this.ctitle = ctitle;
		}
		
		
		
	    

}
