package com.example.books.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.books.R;
import com.example.books.model.Loaisach;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class Loaisachadapter extends BaseAdapter {
    ArrayList<Loaisach> arrayListLoaisach;
    Context context;

    public Loaisachadapter(ArrayList<Loaisach> arrayListLoaisach, Context context) {
        this.arrayListLoaisach = arrayListLoaisach;
        this.context = context;
    }

    @Override
    public int getCount() {
        return arrayListLoaisach.size();
    }

    @Override
    public Object getItem(int i) {
        return arrayListLoaisach.get(i);
    }

    @Override
    public long getItemId(int i) {
        return i;
    }
    public class ViewHolder{
    TextView txttenloaisach;
    ImageView imgloaisach;

    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder viewHolder = null;
        if (view == null) {
            viewHolder = new ViewHolder();
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(context.LAYOUT_INFLATER_SERVICE);
            view = inflater.inflate(R.layout.dong_listview_loaisach, null);
            viewHolder.txttenloaisach = (TextView) view.findViewById(R.id.textviewloaisach);
            viewHolder.imgloaisach = (ImageView) view.findViewById(R.id.imageviewloaisach);
            view.setTag(viewHolder);
        }else{
            viewHolder= (ViewHolder) view.getTag();
        }
        Loaisach loaisach = (Loaisach) getItem(i);
        viewHolder.txttenloaisach.setText(loaisach.getTenloaisach());
        Picasso.get().load(loaisach.getHinhanhloaisach())
                .placeholder(R.drawable.noimage)
                //.error(R.drawable.error)
                .into(viewHolder.imgloaisach);

        return view;
    }
}
