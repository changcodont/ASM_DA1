/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gym.dao;

import com.gym.db.DBHelper;
import com.gym.entity.ChiTietGoiTap;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84934
 */
public class ChiTietGoiTapDAO extends GymSoftwareDAO<ChiTietGoiTap, String> {
    final String INSERT_SQL = "INSERT INTO ChiTietGoiTap(MaKH,MaGT,MaDH,NgayDK,NgayKT,SoLuong,Gia) values (?,?,?,?,?,?,?)";
    final String UPDATE_SQL = "UPDATE ChiTietGoiTap SET MaKH = ?,MaGT = ?,MaDH = ?,NgayDK = ?,NgayKT = ?, SoLuong=?,Gia = ? where MaCTGT=?";
    final String DELETE_SQL = "DELETE FROM ChiTietGoiTap WHERE MaCTGT=?";
    final String SELECT_ALL_SQL = "SELECT * FROM ChiTietGoiTap";
    final String SELECT_BY_ID_SQL = "SELECT * FROM ChiTietGoiTap where MaCTGT=?";

    @Override
    public void insert(ChiTietGoiTap entity) {
        DBHelper.update(INSERT_SQL,
                entity.getMakh(),
                entity.getMagt(),
                entity.getMadh(),
                entity.getNgaydk(),
                entity.getNgaykt(),
                entity.getSoluong(),
                entity.getGia()
        );
    }


    @Override
    public void update(ChiTietGoiTap entity) {
        DBHelper.update(UPDATE_SQL,
                entity.getMakh(),
                entity.getMagt(),
                entity.getMadh(),
                entity.getNgaydk(),
                entity.getNgaykt(),
                entity.getSoluong(),
                entity.getGia(),
                entity.getMactgt()
        );
    }

    @Override
    public void delete(String id) {
        DBHelper.update(DELETE_SQL, id);
    }

    @Override
    protected List<ChiTietGoiTap> selectBySql(String sql, Object... args) {
        List<ChiTietGoiTap> list = new ArrayList<ChiTietGoiTap>();
        try {
            ResultSet rs = (ResultSet) DBHelper.query(sql, args);
            while (rs.next()) {
                ChiTietGoiTap entity = new ChiTietGoiTap();
                entity.setMactgt(rs.getInt("MaCTGT"));
                entity.setMakh(rs.getString("MaDH"));
                entity.setMagt(rs.getString("MaGT"));
                entity.setMadh(rs.getInt("MaDH"));
                entity.setNgaydk(rs.getDate("NgayDK"));
                entity.setNgaykt(rs.getDate("NgayKT"));
                entity.setSoluong(rs.getInt("SoLuong"));
                entity.setGia(rs.getDouble("Gia"));
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public ChiTietGoiTap selectById(String id) {
        List<ChiTietGoiTap> list = this.selectBySql(SELECT_BY_ID_SQL, id);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    public List<ChiTietGoiTap> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    public List<ChiTietGoiTap> selectByKeyword(String keyword) {
        String sql = "SELECT * FROM ChiTietGoiTap WHERE MaCTGT like ?";
        return this.selectBySql(sql, "%" + keyword + "%");
    }

}
