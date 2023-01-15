package com.example.abccinema;

import io.github.cdimascio.dotenv.Dotenv;

public class envBean implements java.io.Serializable {
    // Bean class to hold sensitive database configuration
    protected static final Dotenv env = Dotenv.load();
    protected static final String driver = "org.mariadb.jdbc.Driver";
    protected static final String user = env.get("DB_USER");
    protected static final String password = env.get("DB_PWD");
    protected static final String url = env.get("DB_URL");
    protected static final String mail_user = env.get("MAIL_USER");
    protected static final String mail_pwd = env.get("MAIL_PWD");

    public String getUrl() {
        return url;
    }
    public String getUser() {
        return user;
    }
    public String getPassword() {
        return password;
    }
    public String getDriver() {
        return driver;
    }
}
