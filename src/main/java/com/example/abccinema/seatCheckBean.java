package com.example.abccinema;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.LinkedList;

public class seatCheckBean implements java.io.Serializable {
    // executes some database actions needed by the frontend

    private String reserved; // array of reserved seats
    private String failState = "false"; // if operation failed
    private final LinkedList<String> set = new LinkedList<String>();

    public String getFailState() {
        return failState;
    }

    public String getReserved() {
        return reserved;
    }

    public void setReserved(String id) {
        try {
            // Class.forName(dbUtils.driver); check note on dbUtil class for Driver note
            Connection connection = DriverManager.getConnection(envBean.url, envBean.user, envBean.password);
            PreparedStatement qry = connection.prepareStatement("select reserved from purchase_history where movieId = ?");
            qry.setInt(1, Integer.parseInt(id));
            ResultSet resultSet = qry.executeQuery();
            while (resultSet.next()) {
                String[] out = resultSet.getString(1).split(",");
                set.addAll(Arrays.asList(out));
            }
            reserved = set.toString();
            set.clear();
        } catch (Exception e) {
            failState = "true";
            // e.printStackTrace();
        }
    }
}
