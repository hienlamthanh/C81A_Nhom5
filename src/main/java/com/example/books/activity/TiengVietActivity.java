package com.example.books.activity;

import android.content.Intent;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.ListView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.books.R;
import com.example.books.adapter.TiengvietAdapter;
import com.example.books.model.Sach;
import com.example.books.ultill.CheckConnection;
import com.example.books.ultill.Sever;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class TiengVietActivity extends AppCompatActivity {
    Toolbar toolbartv;
    ListView lvtv;
    TiengvietAdapter tiengvietAdapter;
    ArrayList<Sach> mangtv;
    int idtv = 0;
    int page = 1;
    View footerview;
    boolean isLoading = false;
    boolean limitData = false;
    mHandler mHandler;
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

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tieng_viet);
        Anhxa();
        if (CheckConnection.haveNetworkConnection(getApplicationContext())){
            GetIdloaisach();
            ActionToolbar();
            GetData(page);
            LoadMoreData();
        }else {
            CheckConnection.ShowToast_Short(getApplicationContext(),"Bạn hãy kiểm tra lại kết nối");
            finish();
        }
    }

    private void LoadMoreData() {
        lvtv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent  intent = new Intent(getApplicationContext(),ChiTietSach.class);
                intent.putExtra("thông tin sách",mangtv.get(position));
                startActivity(intent);
            }
        });
        lvtv.setOnScrollListener(new AbsListView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(AbsListView view, int scrollState) {

            }

            @Override
            public void onScroll(AbsListView absListViewview, int FirstItem, int VisibleItem, int TotalItem) {
                if (FirstItem + VisibleItem == TotalItem && TotalItem != 0 && isLoading == false && limitData == false){
                    isLoading = true;
                    ThreaData threaData = new ThreaData();
                    threaData.start();

                }

            }
        });


    }

    private void GetData(int Page) {
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        String duongdan = Sever.DuongDanSachTV+String.valueOf(page);
        StringRequest stringRequest = new StringRequest(Request.Method.POST, duongdan, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                int id = 0;
                String Tentv ="";
                int Giatv = 0;
                String Hinhanhtv="";
                String Motatv = "";
                int Idsachtv=0;
                if(response != null && response.length() != 2){
                    lvtv.removeFooterView(footerview);
                    try {
                        JSONArray jsonArray = new JSONArray(response);
                        for (int i = 0; i<jsonArray.length(); i++){
                            JSONObject jsonObject = jsonArray.getJSONObject(i);
                            id = jsonObject.getInt("id");
                            Tentv = jsonObject.getString("tensach");
                            Giatv = jsonObject.getInt("giasach");
                            Hinhanhtv= jsonObject.getString("hinhanhsach");
                            Motatv =jsonObject.getString("mota");
                            Idsachtv =jsonObject.getInt("idsach");
                            mangtv.add(new Sach(id,Tentv,Giatv,Hinhanhtv,Motatv,Idsachtv));
                            tiengvietAdapter.notifyDataSetChanged();

                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }

                }else {
                    limitData = true;
                    lvtv.removeFooterView(footerview);
                    CheckConnection.ShowToast_Short(getApplicationContext(), " Đã hết dữ liệu");
                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> param = new HashMap<String, String>();
                param.put("idsach", String.valueOf(idtv));
                return param;
            }
        };
        requestQueue.add(stringRequest);
    }

    private void ActionToolbar() {
        setSupportActionBar(toolbartv);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbartv.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

    private void GetIdloaisach() {
        idtv = getIntent().getIntExtra("idLoaisach",-1);
        Log.d("giatriloaisach",idtv+"");
    }

    private void Anhxa() {
        toolbartv = (Toolbar) findViewById(R.id.toolbartiengviet);
        lvtv = (ListView) findViewById(R.id.listviewtiengviet);
        mangtv =new ArrayList<>();
        tiengvietAdapter = new TiengvietAdapter(getApplicationContext(), mangtv);
        lvtv.setAdapter(tiengvietAdapter);
        LayoutInflater inflater = (LayoutInflater) getSystemService(LAYOUT_INFLATER_SERVICE);
        footerview = inflater.inflate(R.layout.progressbar,null);
        mHandler = new mHandler();

    }
    public  class mHandler extends Handler{
        @Override
        public void handleMessage(@NonNull Message msg) {
            switch (msg.what){
                case 0:
                    lvtv.addFooterView(footerview);
                    break;
                case 1:
                    GetData(++page);
                    isLoading = false;
                    break;

            }
            super.handleMessage(msg);
        }
    }
    public class ThreaData extends Thread{
        @Override
        public void run() {
            mHandler.sendEmptyMessage(0);
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            Message message = mHandler.obtainMessage(1);
            mHandler.sendMessage(message);
            super.run();
        }
    }
}
