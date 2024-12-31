package com.example.demo.repository;

import com.example.demo.entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, Integer> {
    @Query("""
    SELECT kh FROM KhachHang kh WHERE id = :idKhachHang
""")
    KhachHang findByIdKH(Integer idKhachHang);

    @Query("SELECT k FROM KhachHang k WHERE sdt = :sdt")
    List<KhachHang> findBySdt(@Param("sdt") String sdt);

    @Override
    List<KhachHang> findAll();
    // -- Tìm kiếm --
    List<KhachHang> findBySdtContaining(String sdt);
    // Check trùng mã khách hàng
    boolean existsByMaKhachHang(String maKhachHang);
}
