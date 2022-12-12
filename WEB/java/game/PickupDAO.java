package game;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PickupDAO {
    private Connection conn;
    private ResultSet rs;

    public PickupDAO() {
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

    public int makeGame(Pickup pickup) {
        String SQL = "INSERT INTO pickup(home_id, juso, date, people, level, age, color, shower, parking, warning) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, pickup.getHome_id());
            pstmt.setString(2, pickup.getRoadAddrPart1());
            pstmt.setString(3, pickup.getDate());
            pstmt.setString(4, pickup.getPeople());
            pstmt.setString(5, pickup.getLevel());
            pstmt.setString(6, pickup.getAge());
            pstmt.setString(7, pickup.getColor());
            pstmt.setString(8, pickup.getShower());
            pstmt.setString(9, pickup.getParking());
            pstmt.setString(10, pickup.getWarning());

            return pstmt.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return -1;
    }
    
    public ArrayList<Pickup> getAllGames() {
        String SQL = "select * from pickup";
        ArrayList<Pickup> list = new ArrayList<Pickup>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Pickup pickup = new Pickup();
                pickup.setId_no(rs.getInt(1));
                pickup.setHome_id(rs.getString(2));
                pickup.setRoadAddrPart1(rs.getString(3));
                pickup.setDate(rs.getString(4));
                pickup.setPeople(rs.getString(5));
                pickup.setLevel(rs.getString(6));
                pickup.setAge(rs.getString(7));
                pickup.setColor(rs.getString(8));
                pickup.setShower(rs.getString(9));
                pickup.setParking(rs.getString(10));
                pickup.setWarning(rs.getString(11));
                list.add(pickup);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Pickup> getGamesByUserId(String home_id) {
        String SQL = "select * from pickup where home_id = ?";
        ArrayList<Pickup> list = new ArrayList<Pickup>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, home_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Pickup pickup = new Pickup();
                pickup.setId_no(rs.getInt(1));
                pickup.setHome_id(rs.getString(2));
                pickup.setRoadAddrPart1(rs.getString(3));
                pickup.setDate(rs.getString(4));
                pickup.setPeople(rs.getString(5));
                pickup.setLevel(rs.getString(6));
                pickup.setAge(rs.getString(7));
                pickup.setColor(rs.getString(8));
                pickup.setShower(rs.getString(9));
                pickup.setParking(rs.getString(10));
                pickup.setWarning(rs.getString(11));
                list.add(pickup);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }

    public Pickup getGameById(int id) {
        String SQL = "select * from pickup where id_no = ?";
        Pickup pickup = new Pickup();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            rs.next();
            pickup.setId_no(rs.getInt(1));
            pickup.setHome_id(rs.getString(2));
            pickup.setRoadAddrPart1(rs.getString(3));
            pickup.setDate(rs.getString(4));
            pickup.setPeople(rs.getString(5));
            pickup.setLevel(rs.getString(6));
            pickup.setAge(rs.getString(7));
            pickup.setColor(rs.getString(8));
            pickup.setShower(rs.getString(9));
            pickup.setParking(rs.getString(10));
            pickup.setWarning(rs.getString(11));
            return pickup;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return pickup;
    }

    public int cancelPickup(int game_id, String user_id) {
        String SQL = "delete from pickup where id_no = ? and home_id = ?";
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
