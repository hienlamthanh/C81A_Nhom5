package com.example.books.model;

public class Loaisach {
    public int Id;
    public  String Tenloaisach;
    public  String Hinhanhloaisach;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getTenloaisach() {
        return Tenloaisach;
    }

    public void setTenloaisach(String tenloaisach) {
        Tenloaisach = tenloaisach;
    }

    public String getHinhanhloaisach() {
        return Hinhanhloaisach;
    }

    public void setHinhanhloaisach(String hinhanhloaisach) {
        Hinhanhloaisach = hinhanhloaisach;
    }

    public Loaisach(int id, String tenloaisach, String hinhanhloaisach) {
        Id = id;
        Tenloaisach = tenloaisach;
        Hinhanhloaisach = hinhanhloaisach;
    }
}
