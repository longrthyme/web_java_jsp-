package com.example.demo.repository;

import com.example.demo.entity.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamChiTietRepo extends JpaRepository<SanPhamChiTiet, Integer> {
    List<SanPhamChiTiet> findAll();
}
