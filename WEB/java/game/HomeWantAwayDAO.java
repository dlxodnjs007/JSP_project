package game;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class HomeWantAwayDAO {
    private Connection conn;
    private ResultSet rs;

    public HomeWantAwayDAO() {
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

    public int makeGame(HomeWantAway homeWantAway) {
        String SQL = 
        "INSERT INTO HOME_WANT_AWAY(home_id, h_team_name, juso, game_date, home_people, home_age, home_uniform, away_people, away_level, away_age, shower, parking, warning) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, homeWantAway.getHome_id());
            pstmt.setString(2, homeWantAway.getH_team_name());
            pstmt.setString(3, homeWantAway.getRoadAddrPart1());
            pstmt.setString(4, homeWantAway.getDate());
            pstmt.setString(5, homeWantAway.getHome_people());
            pstmt.setString(6, homeWantAway.getHome_age());
            pstmt.setString(7, homeWantAway.getHome_uniform());
            pstmt.setString(8, homeWantAway.getAway_people());
            pstmt.setString(9, homeWantAway.getAway_level());
            pstmt.setString(10, homeWantAway.getAway_age());
            pstmt.setString(11, homeWantAway.getShower());
            pstmt.setString(12, homeWantAway.getParking());
            pstmt.setString(13, homeWantAway.getWarning());

            return pstmt.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return -1;
    }

    public ArrayList<HomeWantAway> getAllGames() {
        String SQL = "select * from home_want_away";
        ArrayList<HomeWantAway> list = new ArrayList<HomeWantAway>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                HomeWantAway homeWantAway = new HomeWantAway();
                homeWantAway.setId(rs.getInt(1));
                homeWantAway.setHome_id(rs.getString(2));
                homeWantAway.setH_team_name(rs.getString(3));
                homeWantAway.setRoadAddrPart1(rs.getString(4));
                homeWantAway.setDate(rs.getString(5));
                homeWantAway.setHome_people(rs.getString(6));
                homeWantAway.setHome_age(rs.getString(7));
                homeWantAway.setHome_uniform(rs.getString(8));
                homeWantAway.setAway_people(rs.getString(9));
                homeWantAway.setAway_level(rs.getString(10));
                homeWantAway.setAway_age(rs.getString(11));
                homeWantAway.setShower(rs.getString(12));
                homeWantAway.setParking(rs.getString(13));
                homeWantAway.setWarning(rs.getString(14));
                list.add(homeWantAway);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<HomeWantAway> getGame(String home_id) {
        String SQL = "select * from home_want_away where home_id = ?";
        ArrayList<HomeWantAway> list = new ArrayList<HomeWantAway>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, home_id);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                HomeWantAway homeWantAway = new HomeWantAway();
                homeWantAway.setId(rs.getInt(1));
                homeWantAway.setHome_id(rs.getString(2));
                homeWantAway.setH_team_name(rs.getString(3));
                homeWantAway.setRoadAddrPart1(rs.getString(4));
                homeWantAway.setDate(rs.getString(5));
                homeWantAway.setHome_people(rs.getString(6));
                homeWantAway.setHome_age(rs.getString(7));
                homeWantAway.setHome_uniform(rs.getString(8));
                homeWantAway.setAway_people(rs.getString(9));
                homeWantAway.setAway_level(rs.getString(10));
                homeWantAway.setAway_age(rs.getString(11));
                homeWantAway.setShower(rs.getString(12));
                homeWantAway.setParking(rs.getString(13));
                homeWantAway.setWarning(rs.getString(14));
                list.add(homeWantAway);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }

    public HomeWantAway getGameById(int id) {
        String SQL = "select * from home_want_away where id_no = ?";
        HomeWantAway homeWantAway = new HomeWantAway();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            rs.next();
            homeWantAway.setId(rs.getInt(1));
            homeWantAway.setHome_id(rs.getString(2));
            homeWantAway.setH_team_name(rs.getString(3));
            homeWantAway.setRoadAddrPart1(rs.getString(4));
            homeWantAway.setDate(rs.getString(5));
            homeWantAway.setHome_people(rs.getString(6));
            homeWantAway.setHome_age(rs.getString(7));
            homeWantAway.setHome_uniform(rs.getString(8));
            homeWantAway.setAway_people(rs.getString(9));
            homeWantAway.setAway_level(rs.getString(10));
            homeWantAway.setAway_age(rs.getString(11));
            homeWantAway.setShower(rs.getString(12));
            homeWantAway.setParking(rs.getString(13));
            homeWantAway.setWarning(rs.getString(14));
            return homeWantAway;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return homeWantAway;
    }

    public int cancelHomeGame(int game_id, String user_id) {
        String SQL = "delete from home_want_away where id_no = ? and home_id = ?";
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
}
