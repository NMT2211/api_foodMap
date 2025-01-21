package DAOS;

import java.util.List;
import ENTITYS.QuanAn;

public interface QuanAnDao {
    List<QuanAn> findAll(); // Lấy danh sách tất cả quán ăn
    QuanAn findById(Integer id); // Tìm quán ăn theo ID
    boolean create(QuanAn quanAn); // Thêm quán ăn mới
    boolean update(QuanAn quanAn); // Cập nhật quán ăn
    boolean deleteById(Integer id); // Xóa quán ăn theo ID
    List<QuanAn> findByTinhThanhId(Integer tinhThanhId); // Tìm quán ăn theo tỉnh thành
    List<QuanAn> findByLoaiQuanId(Integer loaiQuanId); // Tìm quán ăn theo loại quán
}
