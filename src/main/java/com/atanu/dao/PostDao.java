package com.atanu.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.atanu.entities.Category;
import com.atanu.entities.Postbox;

public class PostDao {
	
	private Connection connection;

	public PostDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public ArrayList<Category> getAllCategories()
	{
		ArrayList<Category> list=new ArrayList<>();
		
		
		try {
			
			String query="select * from category";
			Statement s=connection.createStatement();
			ResultSet resultSet=s.executeQuery(query);
			
//		System.out.println(resultSet);
			
			while (resultSet.next()) {
				int cid= resultSet.getInt("cid");
				String ctitle=resultSet.getString("ctitle");
				Category c=new Category(cid,ctitle);
				//System.out.println(c);
      			list.add(c);
				
				//System.out.println(resultSet.getInt("cid")+"jii");
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//System.out.println("okkk");
		
		return list;
		
	}
	
	
	public boolean savePost(Postbox p) {
        boolean f = false;
        try {

            String q = "INSERT INTO `postbox`( `ptitle`, `pdesc`, `pcode`, `pimage`,  `catid`,`userid`) VALUES (?,?,?,?,?,?)";
            PreparedStatement pstmt = connection.prepareStatement(q);
            pstmt.setString(1, p.getPtitle());
            pstmt.setString(2, p.getPdesc());
            pstmt.setString(3, p.getPcode());
            pstmt.setString(4, p.getPimage());
            pstmt.setInt(5, p.getCatid());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

	
	
	public List<Postbox> getAllPosts() {

        List<Postbox> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = connection.prepareStatement("select * from postbox order by pid desc");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pdesc = set.getString("pdesc");
                String pcode = set.getString("pcode");
                String pimage = set.getString("pimage");
                Timestamp pdate = set.getTimestamp("pdate");
                int catid = set.getInt("catid");
                int userid = set.getInt("userid");
              Postbox post = new Postbox(pid, ptitle, pdesc, pcode, pimage, pdate, catid, userid);

               list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
	
	
	
	public List<Postbox> getPostByCatId(int catid) {
        List<Postbox> list = new ArrayList<>();
        //fetch all post by id
        //fetch all the post
        try {

            PreparedStatement p = connection.prepareStatement("select * from postbox where catid=?");
            p.setInt(1, catid);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                
               
                
                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pdesc = set.getString("pdesc");
                String pcode = set.getString("pcode");
                String pimage = set.getString("pimage");
                Timestamp pdate = set.getTimestamp("pdate");

                int userid = set.getInt("userid");
                Postbox post = new Postbox(pid, ptitle, pdesc, pcode, pimage, pdate, catid, userid);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
	
	public Postbox getPostByPostId(int postId) {
        Postbox post = null;
        String q = "select * from postbox where pid=?";
        try {
            PreparedStatement p = connection.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pdesc = set.getString("pdesc");
                String pcode = set.getString("pcode");
                String pimage = set.getString("pimage");
                Timestamp date = set.getTimestamp("pdate");
                int catid=set.getInt("catid");
                int userid = set.getInt("userid");
                post = new Postbox(pid, ptitle, pdesc, pcode, pimage, date, catid, userid);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
	
	
}
