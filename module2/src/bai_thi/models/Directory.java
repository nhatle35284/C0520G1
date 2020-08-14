package bai_thi.models;

public class Directory {
    private String numberPhone;
    private String groupNumberPhone;
    private String name;
    private String gender;
    private String address;
    private String birthday;
    private String email;

    public Directory(String numberPhone, String groupNumberPhone, String name, String gender, String address, String birthday, String email) {
        this.numberPhone = numberPhone;
        this.groupNumberPhone = groupNumberPhone;
        this.name = name;
        this.gender = gender;
        this.address = address;
        this.birthday = birthday;
        this.email = email;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public String getGroupNumberPhone() {
        return groupNumberPhone;
    }

    public void setGroupNumberPhone(String groupNumberPhone) {
        this.groupNumberPhone = groupNumberPhone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Directory{" +
                "numberPhone='" + numberPhone + '\'' +
                ", groupNumberPhone='" + groupNumberPhone + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
