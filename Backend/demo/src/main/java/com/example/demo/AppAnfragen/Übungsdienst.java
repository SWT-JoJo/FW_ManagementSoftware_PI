package com.example.demo.AppAnfragen;

import java.sql.*;
import java.util.Scanner;

public class Übungsdienst {
    public static void main(String[] args) {
        Übungsdienst test = new Übungsdienst();
    }
        private void runCommand(Connection con, String dataBase) {
            try {
                String input;
                do {
                    Statement stm = con.createStatement();
                    Scanner scan = new Scanner(System.in);
                    input = "Select * from ";

                    if (input.contains("select")) {
                        ResultSet rs = stm.executeQuery(input);
                        ResultSetMetaData rsmd = rs.getMetaData();
                        int columnCount = rsmd.getColumnCount();
                        int rowCount = 0;
                        int i = 0;

                        while (rs.next()) {
                            StringBuilder row = new StringBuilder();
                            for (i = 1; i <= columnCount; i++) {
                                row.append(rs.getString(i));
                                if (i < columnCount) {
                                    row.append("; \t");
                                }
                            }
                            System.out.println(row.toString());
                        }
                    } else {
                        int rs = stm.executeUpdate(input);
                        if (rs > 0) {
                            System.out.println(dataBase + " erfolgreich geändert");
                        }
                    }
                    System.out.println();
                } while (!input.isEmpty());


            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
    }
}
