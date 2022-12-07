package game;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AwayApplyDAO {
    private Connection conn;
    private ResultSet rs;

    public AwayApplyDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/bbs";
            String dbID = "root";
            String dbPassword = "197562dlxo!";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }

    public int setApplyAway(AwayApply awayApply) {
        String SQL = "INSERT INTO apply_away_info(game_id_no, away_id, away_people, away_level, away_age) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, awayApply.getGame_id_no());
            pstmt.setString(2, awayApply.getAway_id());
            pstmt.setString(3, awayApply.getAway_people());
            pstmt.setString(4, awayApply.getAway_level());
            pstmt.setString(5, awayApply.getAway_age());

            return pstmt.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return -1;
    }

    public int cancelApply(int game_id, String user_id) {
        String SQL = "delete from apply_away_info where game_id_no = ? and away_id = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, game_id);
            pstmt.setString(2, user_id);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return -1;
    }

    public int matchAccept(int apply_id) {
        String SQL = "update apply_away_info set accept_status = 1 where apply_id = ? ";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, apply_id);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return -1;
    }

    public int matchAcceptCancel(int apply_id) {
        String SQL = "update apply_away_info set accept_status = 0 where apply_id = ? ";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, apply_id);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return -1;
    }

    public boolean checkApply(int game_id, String apply_id) {
        String SQL = "Select * from apply_away_info where (game_id_no = ?) and (away_id = ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, game_id);
            pstmt.setString(2, apply_id);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return true;
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<AwayApply> getGamesByUserId(String home_id) {
        String SQL = "select * from apply_away_info where away_id = ? and accept_status = 0";
        ArrayList<AwayApply> list = new ArrayList<AwayApply>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, home_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                AwayApply awayApply = new AwayApply();
                awayApply.setGame_id_no(rs.getInt(2));
                awayApply.setAway_id(rs.getString(3));
                awayApply.setAway_people(rs.getString(4));
                awayApply.setAway_level(rs.getString(5));
                awayApply.setAway_age(rs.getString(6));
                awayApply.setAccept_status(rs.getInt(7));
                list.add(awayApply);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<AwayApply> getAcceptedGamesByUserId(String home_id) {
        String SQL = "select * from apply_away_info where away_id = ? and accept_status = 1";
        ArrayList<AwayApply> list = new ArrayList<AwayApply>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, home_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                AwayApply awayApply = new AwayApply();
                awayApply.setGame_id_no(rs.getInt(2));
                awayApply.setAway_id(rs.getString(3));
                awayApply.setAway_people(rs.getString(4));
                awayApply.setAway_level(rs.getString(5));
                awayApply.setAway_age(rs.getString(6));
                list.add(awayApply);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<HomeWantAway> getGamesByGameId(int game_id) {
        String SQL = "select * from home_want_away where id_no = ?";
        ArrayList<HomeWantAway> list = new ArrayList<HomeWantAway>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, game_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                HomeWantAway homeWantAway = new HomeWantAway();
                homeWantAway.setId(rs.getInt(1));
                homeWantAway.setHome_id(rs.getString(2));
                homeWantAway.setRoadAddrPart1(rs.getString(3));
                homeWantAway.setDate(rs.getString(4));
                homeWantAway.setHome_people(rs.getString(5));
                homeWantAway.setHome_age(rs.getString(6));
                homeWantAway.setHome_uniform(rs.getString(7));
                homeWantAway.setAway_people(rs.getString(8));
                homeWantAway.setAway_level(rs.getString(9));
                homeWantAway.setAway_age(rs.getString(10));
                homeWantAway.setShower(rs.getString(11));
                homeWantAway.setParking(rs.getString(12));
                homeWantAway.setWarning(rs.getString(13));
                list.add(homeWantAway);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }

    public HomeWantAway getHomeGameById(int id) {
        String SQL = "select * from home_want_away where id_no = ?";
        HomeWantAway homeWantAway = new HomeWantAway();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            rs.next();
            homeWantAway.setId(rs.getInt(1));
            homeWantAway.setHome_id(rs.getString(2));
            homeWantAway.setRoadAddrPart1(rs.getString(3));
            homeWantAway.setDate(rs.getString(4));
            homeWantAway.setHome_people(rs.getString(5));
            homeWantAway.setHome_age(rs.getString(6));
            homeWantAway.setHome_uniform(rs.getString(7));
            homeWantAway.setAway_people(rs.getString(8));
            homeWantAway.setAway_level(rs.getString(9));
            homeWantAway.setAway_age(rs.getString(10));
            homeWantAway.setShower(rs.getString(11));
            homeWantAway.setParking(rs.getString(12));
            homeWantAway.setWarning(rs.getString(13));
            return homeWantAway;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return homeWantAway;
    }

    public AwayApply getAwayApplyById(int id) {
        String SQL = "select * from apply_away_info where id_no = ?";
        AwayApply awayApply = new AwayApply();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            rs.next();
            awayApply.setApply_id(rs.getInt(1));
            awayApply.setGame_id_no(rs.getInt(2));
            awayApply.setAway_id(rs.getString(3));
            awayApply.setAway_people(rs.getString(4));
            awayApply.setAway_level(rs.getString(5));
            awayApply.setAway_age(rs.getString(6));
            awayApply.setAccept_status(rs.getInt(7));
            return awayApply;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return awayApply;
    }

    public ArrayList<AwayApply> getAwayGamesByGameId(int game_id) {
        String SQL = "select * from apply_away_info where game_id_no = ?";
        ArrayList<AwayApply> list = new ArrayList<AwayApply>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, game_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                AwayApply awayApply = new AwayApply();
                awayApply.setApply_id(rs.getInt(1));
                awayApply.setGame_id_no(rs.getInt(2));
                awayApply.setAway_id(rs.getString(3));
                awayApply.setAway_people(rs.getString(4));
                awayApply.setAway_level(rs.getString(5));
                awayApply.setAway_age(rs.getString(6));
                awayApply.setAccept_status(rs.getInt(7));
                list.add(awayApply);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<AwayApply> getAppliedGamesByGameId(int game_id) {
        String SQL = "select * from apply_away_info where game_id_no = ?";
        ArrayList<AwayApply> list = new ArrayList<AwayApply>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, game_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                AwayApply awayApply = new AwayApply();
                awayApply.setApply_id(rs.getInt(1));
                awayApply.setGame_id_no(rs.getInt(2));
                awayApply.setAway_id(rs.getString(3));
                awayApply.setAway_people(rs.getString(4));
                awayApply.setAway_level(rs.getString(5));
                awayApply.setAway_age(rs.getString(6));
                awayApply.setAccept_status(rs.getInt(7));
                list.add(awayApply);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }

    
}
