package com.example.books.activity;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

import com.example.books.R;
import com.example.books.model.GioHang;
import com.example.books.model.Sach;
import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;

public class ChiTietSach extends AppCompatActivity {
    Toolbar toolbarChiTiet;
    ImageView imgChiTiet;
    TextView txtten, txtgia, txtmota;
    Spinner spinner;
    Button btndatmua;
    int id = 0;
    String TenChiTiet = "";
    int GiaChiTiet = 0;
    String HinhanhChitiet = "";
    String MotaChitiet = "";
    int IdSach = 0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chi_tiet_sach);
        Anhxa();
        ActionToolBar();
        GetInformation();
        CatchEventSpinner();
        EventButton();
        
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu,menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()){
            case  R.id.menugiohnag:
                Intent intent = new Intent(getApplicationContext(), com.example.books.activity.Giohang.class);
                startActivity(intent);
        }
        return super.onOptionsItemSelected(item);
    }

    private void EventButton() {
        btndatmua.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (MainActivity.manggiohang.size() > 0){
                    int sl = Integer.parseInt(spinner.getSelectedItem().toString());
                    boolean exists = false;
                    for( int i = 0; i < MainActivity.manggiohang.size(); i++){
                        if (MainActivity.manggiohang.get(i).getIdsach() == id) {
                            MainActivity.manggiohang.get(i).setSoluongsach(MainActivity.manggiohang.get(i).getSoluongsach() + sl);
                            if (MainActivity.manggiohang.get(i).getSoluongsach()>=10){
                                MainActivity.manggiohang.get(i).setSoluongsach(10);
                            }
                            MainActivity.manggiohang.get(i).setGiasach(GiaChiTiet * MainActivity.manggiohang.get(i).getSoluongsach());
                            exists = true;
                        }
                    }
                    if (exists == false){
                        int soluong = Integer.parseInt(spinner.getSelectedItem().toString());
                        long Giamoi = soluong * GiaChiTiet;
                        MainActivity.manggiohang.add(new GioHang(id, TenChiTiet, Giamoi, HinhanhChitiet,soluong));

                    }

                }else {
                    int soluong = Integer.parseInt(spinner.getSelectedItem().toString());
                    long Giamoi = soluong * GiaChiTiet;
                    MainActivity.manggiohang.add(new GioHang(id, TenChiTiet, Giamoi, HinhanhChitiet,soluong));
                }
                Intent intent = new Intent(getApplicationContext(), com.example.books.activity.Giohang.class);
                startActivity(intent);

            }
        });
    }

    private void CatchEventSpinner() {
        Integer [] soluong = new Integer[]{1,2,3,4,5,6,7,8,9,10};
        ArrayAdapter<Integer> arrayAdapter = new ArrayAdapter<Integer>(this,android.R.layout.simple_spinner_dropdown_item,soluong);
        spinner.setAdapter(arrayAdapter);
    }

    private void GetInformation() {

        Sach sach = (Sach) getIntent().getSerializableExtra("thông tin sách");
        id = sach.getID();
        TenChiTiet = sach.getTensach();
        GiaChiTiet = sach.getGiasach();
        HinhanhChitiet = sach.getHinhanhsach();
        MotaChitiet = sach.getMota();
        IdSach = sach.getIDSach();
        txtten.setText(TenChiTiet);
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        txtgia.setText("Giá: " + decimalFormat.format(GiaChiTiet) + "Đ");
        txtmota.setText(MotaChitiet);
        Picasso.get().load(HinhanhChitiet).placeholder(R.drawable.noimage)
                .error(R.drawable.error).into(imgChiTiet);
    }

    private void ActionToolBar() {
        setSupportActionBar(toolbarChiTiet);
        getSupportActionBar(). setDisplayHomeAsUpEnabled(true);
        toolbarChiTiet.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

    private void Anhxa() {
        toolbarChiTiet = (Toolbar) findViewById(R.id.toolbarchitietsach);
        imgChiTiet = (ImageView) findViewById(R.id.imageviewchitietsach);
        txtten = (TextView) findViewById(R.id.textviewtenchitietsach);
        txtgia = (TextView) findViewById(R.id.textviewgiachitietsach);
        txtmota = (TextView) findViewById(R.id.textviewmotachitietsach);
        spinner = (Spinner) findViewById(R.id.spinner);
        btndatmua = (Button) findViewById(R.id.buttondatmua);
    }
}
