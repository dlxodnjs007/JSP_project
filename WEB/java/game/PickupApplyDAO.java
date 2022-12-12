package game;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PickupApplyDAO {
    private Connection conn;
    private ResultSet rs;

    public PickupApplyDAO() {
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

    public int setApplyPickup(PickupApply pickupApply) {
        String SQL = "INSERT INTO apply_pickup_info(game_id_no, guest_id, name, height, position, age) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, pickupApply.getGame_id_no());
            pstmt.setString(2, pickupApply.getGuest_id());
            pstmt.setString(3, pickupApply.getName());
            pstmt.setString(4, pickupApply.getHeight());
            pstmt.setString(5, pickupApply.getPosition());
            pstmt.setString(6, pickupApply.getAge());

            return pstmt.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return -1;
    }
    
    public boolean checkApply(int game_id, String apply_id) {
        String SQL = "Select * from apply_pickup_info where (game_id_no = ?) and (guest_id = ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, game_id);
            pstmt.setString(2, apply_id);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return false;
    }

    public int matchAccept(int apply_id) {
        String SQL = "update apply_pickup_info set accept_status = 1 where apply_id = ? ";
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
        String SQL = "update apply_pickup_info set accept_status = 0 where apply_id = ? ";
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

    public int cancelApply(int game_id, String user_id) {
        String SQL = "delete from apply_pickup_info where game_id_no = ? and guest_id = ?";
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

    public ArrayList<PickupApply> getPickupGamesByGameId(int game_id) {
        String SQL = "select * from apply_pick_info where game_id_no = ?";
        ArrayList<PickupApply> list = new ArrayList<PickupApply>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, game_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PickupApply pickupApply = new PickupApply();
                pickupApply.setApply_id(rs.getInt(1));
                pickupApply.setGame_id_no(rs.getInt(2));
                pickupApply.setGuest_id(rs.getString(3));
                pickupApply.setName(rs.getString(4));
                pickupApply.setHeight(rs.getString(5));
                pickupApply.setPosition(rs.getString(6));
                pickupApply.setAge(rs.getString(7));
                pickupApply.setAccept_status(rs.getInt(8));
                list.add(pickupApply);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }

    public Pickup getPickupById(int id) {
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

    public ArrayList<Pickup> getGamesByGameId(int game_id) {
        String SQL = "select * from pickup where id_no = ?";
        ArrayList<Pickup> list = new ArrayList<Pickup>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, game_id);
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

    public PickupApply getPickupApplyByGameId(int id) {
        String SQL = "select * from apply_pickup_info where game_id_no = ?";
        PickupApply pickupApply = new PickupApply();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            rs.next();
            pickupApply.setApply_id(rs.getInt(1));
            pickupApply.setGame_id_no(rs.getInt(2));
            pickupApply.setGuest_id(rs.getString(3));
            pickupApply.setName(rs.getString(4));
            pickupApply.setHeight(rs.getString(5));
            pickupApply.setPosition(rs.getString(6));
            pickupApply.setAge(rs.getString(7));
            pickupApply.setAccept_status(rs.getInt(8));
            return pickupApply;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return pickupApply;
    }

    public PickupApply getNotAcceptedApplyByGameIdAndUserId(int game_id, String user_id) {
        String SQL = "select * from apply_pickup_info where game_id_no = ? and guest_id = ? and accept_status = 0";
        PickupApply pickupApply = new PickupApply();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, game_id);
            pstmt.setString(2, user_id);
            rs = pstmt.executeQuery();
            rs.next();
            pickupApply.setApply_id(rs.getInt(1));
            pickupApply.setGame_id_no(rs.getInt(2));
            pickupApply.setGuest_id(rs.getString(3));
            pickupApply.setName(rs.getString(4));
            pickupApply.setHeight(rs.getString(5));
            pickupApply.setPosition(rs.getString(6));
            pickupApply.setAge(rs.getString(7));
            pickupApply.setAccept_status(rs.getInt(8));
            return pickupApply;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return pickupApply;
    }

    public ArrayList<PickupApply> getNotAcceptedGamesByUserId(String user_id) {
        String SQL = "select * from apply_pickup_info where guest_id = ? and accept_status = 0";
        ArrayList<PickupApply> list = new ArrayList<PickupApply>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PickupApply pickupApply = new PickupApply();
                pickupApply.setApply_id(rs.getInt(1));
                pickupApply.setGame_id_no(rs.getInt(2));
                pickupApply.setGuest_id(rs.getString(3));
                pickupApply.setName(rs.getString(4));
                pickupApply.setHeight(rs.getString(5));
                pickupApply.setPosition(rs.getString(6));
                pickupApply.setAge(rs.getString(7));
                pickupApply.setAccept_status(rs.getInt(8));
                list.add(pickupApply);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<PickupApply> getAcceptedGamesByUserId(String home_id) {
        String SQL = "select * from apply_pickup_info where guest_id = ? and accept_status = 1";
        ArrayList<PickupApply> list = new ArrayList<PickupApply>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, home_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PickupApply pickupApply = new PickupApply();
                pickupApply.setApply_id(rs.getInt(1));
                pickupApply.setGame_id_no(rs.getInt(2));
                pickupApply.setGuest_id(rs.getString(3));
                pickupApply.setName(rs.getString(4));
                pickupApply.setHeight(rs.getString(5));
                pickupApply.setPosition(rs.getString(6));
                pickupApply.setAge(rs.getString(7));
                pickupApply.setAccept_status(rs.getInt(8));
                list.add(pickupApply);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<PickupApply> getPickupAppliesByGameId(int game_id) {
        String SQL = "select * from apply_pickup_info where game_id_no = ?";
        ArrayList<PickupApply> list = new ArrayList<PickupApply>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, game_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PickupApply pickupApply = new PickupApply();
                pickupApply.setApply_id(rs.getInt(1));
                pickupApply.setGame_id_no(rs.getInt(2));
                pickupApply.setGuest_id(rs.getString(3));
                pickupApply.setName(rs.getString(4));
                pickupApply.setHeight(rs.getString(5));
                pickupApply.setPosition(rs.getString(6));
                pickupApply.setAge(rs.getString(7));
                pickupApply.setAccept_status(rs.getInt(8));
                list.add(pickupApply);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return list;
    }

}
