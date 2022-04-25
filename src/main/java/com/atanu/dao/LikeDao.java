package com.atanu.dao;
import java.sql.*;

public class LikeDao {
	private Connection connection;

	public LikeDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	
	public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {
            String q = "insert into liketable (likeuid,likepid)values(?,?)";
            PreparedStatement p = connection.prepareStatement(q);
            //values set...
            p.setInt(1, uid);
            p.setInt(2, pid);
            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
	
	
	public int countLikeOnPost(int pid) {
        int count = 0;

        String q = "select count(*) from liketable where likepid=?";
        try {
            PreparedStatement p = connection.prepareStatement(q);
            p.setInt(1, pid);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
	
	public boolean deleteLike(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement p = this.connection.prepareStatement("delete from liketable where likepid=? and likeuid=? ");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
	
}
