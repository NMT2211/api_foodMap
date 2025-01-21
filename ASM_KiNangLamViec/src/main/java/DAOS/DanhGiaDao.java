package DAOS;

import java.util.List;
import ENTITYS.DanhGia;

public interface DanhGiaDao {
    List<DanhGia> findAll(); // Lấy danh sách tất cả đánh giá
    DanhGia findById(Integer id); // Tìm đánh giá theo ID
    boolean create(DanhGia review); // Thêm đánh giá mới
    boolean update(DanhGia review); // Cập nhật đánh giá
    boolean deleteById(Integer id); // Xóa đánh giá theo ID
    List<DanhGia> findByQuanAnId(Integer quanAnId); // Tìm đánh giá theo quán ăn
    List<DanhGia> findByUserId(String userId); // Tìm đánh giá theo người dùng
}
