    package com.example.demo.entity;
    
    import jakarta.persistence.Column;
    import jakarta.persistence.Entity;
    import jakarta.persistence.GeneratedValue;
    import jakarta.persistence.GenerationType;
    import jakarta.persistence.Id;
    import jakarta.persistence.Table;
    import lombok.AllArgsConstructor;
    import lombok.Getter;
    import lombok.NoArgsConstructor;
    import lombok.Setter;
    
    @Entity
    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @Table(name = "san_pham")
    
    public class SanPham {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "id_san_pham")
        Integer id;
    
        @Column(name = "ma_sp")
        String ma;
    
        @Column(name = "ten_sp")
        String ten;
    
        @Column(name = "loai")
        String loai;
    
        @Column(name = "trang_thai")
        Boolean trangThai;
    }