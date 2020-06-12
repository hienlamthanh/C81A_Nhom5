package com.example.books.adapter;

import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.books.R;
import com.example.books.activity.ChiTietSach;
import com.example.books.model.Sach;
import com.example.books.ultill.CheckConnection;
import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class SachAdapter extends RecyclerView.Adapter<SachAdapter.ItemHolder> {
    @NonNull
    Context context;
    ArrayList<Sach> arraysach;

    public SachAdapter(@NonNull Context context, ArrayList<Sach> arraysach) {
        this.context = context;
        this.arraysach = arraysach;
    }

    @Override
    public ItemHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.dong_sachmoinhat,null);
        ItemHolder itemHolder = new ItemHolder(v);

        return itemHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull ItemHolder holder, int position) {
        Sach sach = arraysach.get(position);
        holder.txttensach.setText(sach.getTensach());
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        holder.txtgiasach.setText("Giá: " + decimalFormat.format(sach.getGiasach())+ "Đồng");
        Picasso.get().load(sach.getHinhanhsach())
                .placeholder(R.drawable.noimage).error(R.drawable.error).into(holder.imghinhsach);


    }

    @Override
    public int getItemCount() {
        return arraysach.size();
    }

    public class ItemHolder extends RecyclerView.ViewHolder{
        public ImageView imghinhsach;
        public TextView txttensach, txtgiasach;

        public ItemHolder(@NonNull View itemView) {
            super(itemView);
            imghinhsach = (ImageView) itemView.findViewById(R.id.imageviewsach);
            txtgiasach = (TextView) itemView.findViewById(R.id.textviewgiasach);
            txttensach = (TextView) itemView.findViewById(R.id.textviewtensach);
            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Intent intent = new Intent(context, ChiTietSach.class);
                    intent.putExtra("thông tin sách", arraysach.get(getPosition()));
                    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    CheckConnection.ShowToast_Short(context, arraysach.get(getPosition()).getTensach());
                    context.startActivity(intent);
                }
            });
        }
    }
}
