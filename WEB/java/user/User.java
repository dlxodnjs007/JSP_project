package user;

public class User {
    private String user_id;
    private String password;
    private String name;
    private String email;
    private String height;
    private String elite_or_not;
    
    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getHeight() {
        return height;
    }
    public void setHeight(String height) {
        this.height = height;
    }
    public String getElite_or_not() {
        return elite_or_not;
    }
    public void setElite_or_not(String elite_or_not) {
        this.elite_or_not = elite_or_not;
    }
}