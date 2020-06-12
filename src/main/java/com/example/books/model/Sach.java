package com.example.books.model;

import java.io.Serializable;

public class Sach implements Serializable {
    public int ID;
    public String Tensach;
    public Integer Giasach;
    public  String Hinhanhsach;
    public String Mota;
    public int IDSach;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTensach() {
        return Tensach;
    }

    public void setTensach(String tensach) {
        Tensach = tensach;
    }

    public Integer getGiasach() {
        return Giasach;
    }

    public void setGiasach(Integer giasach) {
        Giasach = giasach;
    }

    public String getHinhanhsach() {
        return Hinhanhsach;
    }

    public void setHinhanhsach(String hinhanhsach) {
        Hinhanhsach = hinhanhsach;
    }

    public String getMota() {
        return Mota;
    }

    public void setMota(String mota) {
        Mota = mota;
    }

    public int getIDSach() {
        return IDSach;
    }

    public void setIDSach(int IDSach) {
        this.IDSach = IDSach;
    }

    public Sach(int ID, String tensach, Integer giasach, String hinhanhsach, String mota, int IDSach) {
        this.ID = ID;
        Tensach = tensach;
        Giasach = giasach;
        Hinhanhsach = hinhanhsach;
        Mota = mota;
        this.IDSach = IDSach;
    }
}
