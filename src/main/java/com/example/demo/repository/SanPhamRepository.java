package com.example.demo.repository;

import com.example.demo.entity.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {

    List<SanPham> findByMaContainingAndTrangThai(String ma, Boolean trangThai);

    List<SanPham> findByTenContainingAndTrangThai(String ten, Boolean trangThai);

    List<SanPham> findByTrangThai(Boolean trangThai);

    // Tìm kiếm sản phẩm theo tên có phân trang
    Page<SanPham> findByTenContaining(String ten, Pageable pageable);

}
