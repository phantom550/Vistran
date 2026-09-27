package com.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String DEFAULT_URL  = "jdbc:mysql://localhost:3306/void4";
    private static final String DEFAULT_USER = "root";
    private static final String DEFAULT_PASS = "root";

    // Shared connection, lazily (re)created by getConnection() below.
    private static volatile Connection con = null;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            /*Class.forName("org.postgresql.Driver");*/
        } catch (ClassNotFoundException e) {
            // No point going further if the driver itself isn't on the classpath.
            throw new ExceptionInInitializerError(
                "MySQL JDBC driver not found: " + e.getMessage());
        }
    }

    /**
     * Returns a live connection, (re)connecting if the cached one is missing
     * or has died.
     *
     * The previous version opened the connection exactly once, in a static
     * initializer, and cached it forever:
     *   - if that one attempt failed (bad/missing DB config, DB not
     *     reachable yet at startup, etc.) the exception was only printed and
     *     the field stayed null forever, so every servlet's
     *     con.prepareStatement(...) blew up with a NullPointerException.
     *   - if the connection later dropped (idle timeout, network blip, DB
     *     restart) nothing ever replaced it, so every subsequent query threw
     *     "This connection has been closed".
     *
     * This version checks the cached connection before handing it out,
     * transparently reconnects when it's absent or dead, and throws the real
     * SQLException instead of silently returning null so callers (and their
     * existing catch (Exception e) blocks) see what actually went wrong.
     */
    public synchronized Connection getConnection() throws SQLException {
        if (con == null || con.isClosed()) {
            con = DriverManager.getConnection(buildUrl(), resolveUser(), resolvePass());
        }
        return con;
    }

    /**
     * Builds the JDBC URL. Supports two shapes of configuration:
     *   1. A single, ready-made DB_URL (used as-is if present).
     *   2. The separate DB_HOST / DB_PORT / DB_DATABASE variables the
     *      platform actually provides for this deployment, from which we
     *      assemble a TiDB Cloud-compatible URL (TiDB Cloud requires TLS,
     *      hence sslMode=VERIFY_IDENTITY).
     * Falls back to a local dev database if neither is configured.
     */
    private String buildUrl() {
        String url = System.getenv("DB_URL");
        if (url != null && !url.isBlank()) {
            return url;
        }

        String host = System.getenv("DB_HOST");
        if (host != null && !host.isBlank()) {
            String port = firstNonBlank(System.getenv("DB_PORT"), "4000");
            String db   = firstNonBlank(System.getenv("DB_DATABASE"), "db");

            StringBuilder sb = new StringBuilder("jdbc:mysql://")
                .append(host).append(':').append(port).append('/').append(db)
                .append("?sslMode=VERIFY_IDENTITY");

            // Optional CA cert path, if your platform supplies one. Adjust
            // the env var name here to match whatever it's actually called.
            String ca = firstNonBlank(System.getenv("DB_CA"), System.getenv("DB_CA_PATH"));
            if (ca != null) {
                sb.append("&sslCA=").append(ca);
            }
            return sb.toString();
        }

        return DEFAULT_URL;
    }

    private String resolveUser() {
        return firstNonBlank(System.getenv("DB_USERNAME"), System.getenv("DB_USER"), DEFAULT_USER);
    }

    private String resolvePass() {
        return firstNonBlank(System.getenv("DB_PASSWORD"), DEFAULT_PASS);
    }

    private static String firstNonBlank(String... values) {
        for (String v : values) {
            if (v != null && !v.isBlank()) {
                return v;
            }
        }
        return null;
    }
}