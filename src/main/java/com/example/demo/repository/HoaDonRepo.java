package com.example.demo.repository;

import com.example.demo.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonRepo extends JpaRepository<HoaDon, Integer> {
    @Query("""
    SELECT hd
        FROM HoaDon hd
        WHERE hd.id_hoa_don = :idHoaDon
    """)
    HoaDon findByIdHD(Integer idHoaDon);

    @Query("""
    SELECT hd
    FROM HoaDon hd
    WHERE hd.id_thanh_toan = 2
""")
    List<HoaDon> allHoaDonCho();

}