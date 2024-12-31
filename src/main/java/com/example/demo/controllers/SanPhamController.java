package com.example.demo.controllers;

import com.example.demo.entity.SanPham;
import com.example.demo.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("san-pham")
public class SanPhamController {

    @Autowired
    SanPhamRepository sanPhamrepo;

    @GetMapping("/index")
    public String hienThiSanPham(Model model, @RequestParam("page") Optional<Integer> PageNo) {
        Pageable pageable = PageRequest.of(PageNo.orElse(0),5);
        Page<SanPham> page = sanPhamrepo.findAll(pageable);
        model.addAttribute("page",page);

        return "san_pham/index"; //
    }

    //add
    @PostMapping("/them")
    public String themSanPham(@ModelAttribute SanPham sp, Model model) {
        if (sp.getMa() == null || sp.getMa().isEmpty() ||
                sp.getTen() == null || sp.getTen().isEmpty() ||
                sp.getLoai() == null || sp.getLoai().isEmpty()) {

            model.addAttribute("error", "Vui lòng điền đủ thông tin sản phẩm.");
            List<SanPham> list = sanPhamrepo.findAll();
            model.addAttribute("list", list);
            return "san_pham/index";
        }

        sanPhamrepo.save(sp);
        return "redirect:/san-pham/index";
    }

    //delete
    @PostMapping("/xoa/{id}")
    public String xoaSanPham(@PathVariable("id") Integer id) {
        sanPhamrepo.deleteById(id);  // Xóa sản phẩm với id tương ứng
        return "redirect:/san-pham/index";  // Quay lại danh sách sản phẩm
    }


    //update
    @GetMapping("/cap-nhat/{id}")
    public String showUpdateForm(@PathVariable Integer id, Model model) {
        SanPham sp = sanPhamrepo.findById(id).orElse(null);
        model.addAttribute("sp", sp);
        return "san_pham/update";
    }

    @PostMapping("/cap-nhat")
    public String updateSanPham(@ModelAttribute SanPham sp) {
        sanPhamrepo.save(sp); // Cập nhật sản phẩm
        return "redirect:/san-pham/index";
    }


    @GetMapping("/tim-kiem")
    public String searchSanPham(@RequestParam("searchTen") String searchTen,
                                @RequestParam(value = "searchTrangThai", required = false) String trangThai,
                                @RequestParam("page") Optional<Integer> pageNo, // Nhận tham số số trang
                                Model model) {





        // Số trang hiện tại, mặc định là 0 (trang đầu tiên)
        int currentPage = pageNo.orElse(0);

        // Kích thước của một trang, ở đây là 3 sản phẩm mỗi trang
        int pageSize = 3;

                // Tạo đối tượng Pageable
        Pageable pageable = PageRequest.of(currentPage, pageSize);

        Page<SanPham> page;

        if (trangThai != null && !trangThai.equals("")) {
            Integer status = Boolean.valueOf(trangThai) ? 1 : 0;
            System.out.println("trang thai " +  status);
            page = sanPhamrepo.findByTenContainingAndTrangThai(searchTen, status  , pageable);
            model.addAttribute("searchTrangThai", trangThai);
        }
        else {
            // Tìm kiếm sản phẩm theo tên với phân trang
            page = sanPhamrepo.findByTenContaining(searchTen, pageable);
        }

        // Đưa thông tin vào model
        model.addAttribute("searchValue", searchTen);
        model.addAttribute("page", page);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("searchTen", searchTen);  // Giữ lại giá trị tìm kiếm

        return "san_pham/index"; // Trả về trang hiển thị sản phẩm
    }
}
