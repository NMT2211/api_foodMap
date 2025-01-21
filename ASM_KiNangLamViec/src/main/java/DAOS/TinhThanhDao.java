package DAOS;

import java.util.List;
import ENTITYS.TinhThanh;

public interface TinhThanhDao {
    List<TinhThanh> findAll(); // Lấy danh sách tất cả tỉnh thành
    TinhThanh findById(Integer id); // Tìm tỉnh thành theo ID
    boolean create(TinhThanh tinhThanh); // Tạo tỉnh thành mới
    boolean update(TinhThanh tinhThanh); // Cập nhật tỉnh thành
    boolean deleteById(Integer id); // Xóa tỉnh thành theo ID
}
