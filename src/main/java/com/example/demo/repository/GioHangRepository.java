package com.example.demo.repository;

import com.example.demo.entity.GioHang;
import com.example.demo.response.GioHangResponse;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GioHangRepository extends JpaRepository<GioHang, Integer> {

    @Query("""
    Select new com.example.demo.response.GioHangResponse(gh.id,gh.ma,gh.nguoiNhan,gh.sdt,gh.email,gh.noiNhan,gh.khachHang.tenKhachHang)
    From GioHang gh
    """)
    List<GioHangResponse> getAll();

    @Transactional
    @Modifying
    @Query(value = """
        DELETE FROM GioHang where id = :id
    """, nativeQuery = true)
    void delete(Integer id);
}
