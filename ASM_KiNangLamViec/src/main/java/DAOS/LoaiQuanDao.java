package DAOS;

import java.util.List;
import ENTITYS.LoaiQuan;

public interface LoaiQuanDao {
    List<LoaiQuan> findAll(); // Lấy danh sách tất cả loại quán
    LoaiQuan findById(Integer id); // Tìm loại quán theo ID
    boolean create(LoaiQuan loaiQuan); // Thêm loại quán mới
    boolean update(LoaiQuan loaiQuan); // Cập nhật loại quán
    boolean deleteById(Integer id); // Xóa loại quán theo ID
}
