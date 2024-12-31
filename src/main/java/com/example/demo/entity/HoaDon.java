package com.example.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "hoa_don")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_hoa_don")
    private Integer id_hoa_don;
    @Column(name = "ma_hd")
    private String ma_hd;
//    @Column(name = "id_khach_hang")
//    private Integer id_khach_hang;
//    @Column(name = "id_nhan_vien")
//    private Integer id_nhan_vien;

    @Column(name = "id_thanh_toan")
    private Integer id_thanh_toan;

    @Column(name = "id_voucher")
    private Integer id_voucher;

    @Column(name = "tong_tien")
    private Double tong_tien;

    @Column(name = "ngay_tao")
    private Date ngay_tao;

    @Column(name = "diachi")
    private String diachi;


    @Column(name = "email")
    private String email;

    @Column(name = "sdt")
    private String sdt;
    @Column(name = "trang_thai_don_hang")
    private String trang_thai_don_hang;

    @Column(name = "trang_thai")
    private int trangThai;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang", referencedColumnName = "id_khach_hang")
    private KhachHang khachHang;
    @ManyToOne
    @JoinColumn(name = "id_loai_thanh_toan", referencedColumnName = "id_loai_thanh_toan")
    private LoaiThanhToan loaiThanhToan;

    @ManyToOne
    @JoinColumn(name = "id_nhan_vien", referencedColumnName = "id_nhan_vien")
    private NhanVien nhanVien;
//    @ManyToOne
//    @JoinColumn(name = "id")
//    private KhachHang khachHang;
//    @ManyToOne
//    @JoinColumn(name = "id")
//    private KhachHang khachHang;
//    @ManyToOne
//    @JoinColumn(name = "id")
//    private KhachHang khachHang;
//    @ManyToOne
//    @JoinColumn(name = "id")
//    private KhachHang khachHang;
}
