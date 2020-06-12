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
import com.example.books.adapter.EnglishAdapter;
import com.example.books.model.Sach;
import com.example.books.ultill.CheckConnection;
import com.example.books.ultill.Sever;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class EnglishActivity extends AppCompatActivity {
    Toolbar toolbarenglish;
    ListView lvenglish;
    EnglishAdapter englishAdapter;
    ArrayList<Sach> mangenglish;
    int idenglish = 0;
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
        setContentView(R.layout.activity_english);
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
        lvenglish.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(getApplicationContext(),ChiTietSach.class);
                intent.putExtra("thông tin sách",mangenglish.get(position));
                startActivity(intent);
            }
        });
        lvenglish.setOnScrollListener(new AbsListView.OnScrollListener() {
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
                String Tenenglish ="";
                int Giaenglish = 0;
                String Hinhanhenglish="";
                String Motaenglish = "";
                int Idsachenglish=0;
                if(response != null && response.length() != 2){
                    lvenglish.removeFooterView(footerview);
                    try {
                        JSONArray jsonArray = new JSONArray(response);
                        for (int i = 0; i<jsonArray.length(); i++){
                            JSONObject jsonObject = jsonArray.getJSONObject(i);
                            id = jsonObject.getInt("id");
                            Tenenglish = jsonObject.getString("tensach");
                            Giaenglish = jsonObject.getInt("giasach");
                            Hinhanhenglish= jsonObject.getString("hinhanhsach");
                            Motaenglish =jsonObject.getString("mota");
                            Idsachenglish =jsonObject.getInt("idsach");
                            mangenglish.add(new Sach(id,Tenenglish,Giaenglish,Hinhanhenglish,Motaenglish,Idsachenglish));
                            englishAdapter.notifyDataSetChanged();

                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }

                }else {
                    limitData = true;
                    lvenglish.removeFooterView(footerview);
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
                param.put("idsach", String.valueOf(idenglish));
                return param;
            }
        };
        requestQueue.add(stringRequest);
    }

    private void ActionToolbar() {
        setSupportActionBar(toolbarenglish);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbarenglish.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }


    private void GetIdloaisach() {
        idenglish = getIntent().getIntExtra("idLoaisach",-1);
        //Log.d("giatriloaisach",idenglish+"");
    }

    private void Anhxa() {
        toolbarenglish = (Toolbar) findViewById(R.id.toolbarEnglish);
        lvenglish = (ListView) findViewById(R.id.listviewEnglish);
        mangenglish =new ArrayList<>();
        englishAdapter = new EnglishAdapter(getApplicationContext(), mangenglish);
        lvenglish.setAdapter(englishAdapter);
        LayoutInflater inflater = (LayoutInflater) getSystemService(LAYOUT_INFLATER_SERVICE);
        footerview = inflater.inflate(R.layout.progressbar,null);
        mHandler = new mHandler();

    }
    public  class mHandler extends Handler {
        @Override
        public void handleMessage(@NonNull Message msg) {
            switch (msg.what){
                case 0:
                    lvenglish.addFooterView(footerview);
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
