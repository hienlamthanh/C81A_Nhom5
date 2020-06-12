package com.example.books.adapter;

import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.books.R;
import com.example.books.model.Sach;
import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class TiengvietAdapter extends BaseAdapter {
    Context context;
    ArrayList<Sach> arraytiengviet;

    public TiengvietAdapter(Context context, ArrayList<Sach> arraytiengviet) {
        this.context = context;
        this.arraytiengviet = arraytiengviet;
    }

    @Override
    public int getCount() {
        return arraytiengviet.size();
    }

    @Override
    public Object getItem(int i) {
        return arraytiengviet.get(i);
    }

    @Override
    public long getItemId(int i) {
        return i;
    }
    public class ViewHolder{
        public TextView txttensachtv,txtgiasachtv, txtmotasachtv;
        public ImageView imgsachtv;

    }

    @Override
    public View getView(int position, View view, ViewGroup viewGroup) {
        ViewHolder viewHolder = null;
        if (view == null){
            viewHolder = new ViewHolder();
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            view = inflater.inflate(R.layout.dong_tiengviet,null);
            viewHolder.txttensachtv =view.findViewById(R.id.textviewtensachtiengviet);
            viewHolder.txtgiasachtv = view.findViewById(R.id.textviewgiasachtiengviet);
            viewHolder.txtmotasachtv = view.findViewById(R.id.textviewmotasachtiengviet);
            viewHolder.imgsachtv = view.findViewById(R.id.imagetiengviet);
            view.setTag(viewHolder);
        }else {
            viewHolder = (ViewHolder) view.getTag();
        }
        Sach sach = (Sach) getItem(position);
        viewHolder.txttensachtv.setText(sach.getTensach());
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        viewHolder.txtgiasachtv.setText("Giá: " + decimalFormat.format(sach.getGiasach())+ "Đ");
        viewHolder.txtmotasachtv.setMaxLines(2);
        viewHolder.txtmotasachtv.setEllipsize(TextUtils.TruncateAt.END);
        viewHolder.txtmotasachtv.setText(sach.getMota());
        Picasso.get().load(sach.getHinhanhsach())
                .placeholder(R.drawable.noimage)
                .error(R.drawable.error).into(viewHolder.imgsachtv);

        return view;
    }
}
