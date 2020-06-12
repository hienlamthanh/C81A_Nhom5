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

public class EnglishAdapter  extends BaseAdapter {
    Context context;

    public EnglishAdapter(Context context, ArrayList<Sach> arrayenglish) {
        this.context = context;
        this.arrayenglish = arrayenglish;
    }

    ArrayList<Sach> arrayenglish;

    @Override
    public int getCount() {
        return arrayenglish.size();
    }

    @Override
    public Object getItem(int i) {
        return arrayenglish.get(i);
    }

    @Override
    public long getItemId(int i) {
        return i;
    }
    public class ViewHolder{
        public TextView txttensachE,txtgiasachE, txtmotasachE;
        public ImageView imgsachE;

    }

    @Override
    public View getView(int position, View view, ViewGroup viewGroup) {
        EnglishAdapter.ViewHolder viewHolder = null;
        if (view == null){
            viewHolder = new ViewHolder();
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            view = inflater.inflate(R.layout.dong_english,null);
            viewHolder.txttensachE =view.findViewById(R.id.textviewtensachenglish);
            viewHolder.txtgiasachE = view.findViewById(R.id.textviewgiasachenglish);
            viewHolder.txtmotasachE = view.findViewById(R.id.textviewmotasachenglish);
            viewHolder.imgsachE = view.findViewById(R.id.imageenglish);
            view.setTag(viewHolder);
        }else {
            viewHolder = (EnglishAdapter.ViewHolder) view.getTag();
        }
        Sach sach = (Sach) getItem(position);
        viewHolder.txttensachE.setText(sach.getTensach());
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        viewHolder.txtgiasachE.setText("Giá: " + decimalFormat.format(sach.getGiasach())+ "Đ");
        viewHolder.txtmotasachE.setMaxLines(2);
        viewHolder.txtmotasachE.setEllipsize(TextUtils.TruncateAt.END);
        viewHolder.txtmotasachE.setText(sach.getMota());
        Picasso.get().load(sach.getHinhanhsach())
                .placeholder(R.drawable.noimage)
                .error(R.drawable.error).into(viewHolder.imgsachE);

        return view;
    }
}
