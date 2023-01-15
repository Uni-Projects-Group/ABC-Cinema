package com.example.abccinema;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class seatCheckBean extends envBean {
    // executes some database actions needed by the frontend

    private String reserved; // array of reserved seats
    private String failState = "false"; // if operation failed

    public String getFailState() {
        return failState;
    }

    public String getReserved() {
        return this.reserved;
    }

    public void setReserved(String id) {
        try {
            // Class.forName(dbUtils.driver); check note on dbUtil class for Driver note
            Connection connection = DriverManager.getConnection(envBean.url, envBean.user, envBean.password);
            PreparedStatement qry = connection.prepareStatement("select * from dummy_reserved where mov_id = ?");
            qry.setInt(1, Integer.parseInt(id));
            ResultSet resultSet = qry.executeQuery();
            while (resultSet.next()) {
                reserved = resultSet.getString(2);
            }
        } catch (Exception e) {
            failState = "true";
        }
    }
}
