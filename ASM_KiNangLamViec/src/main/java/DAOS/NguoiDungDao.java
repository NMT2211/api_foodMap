package DAOS;

import java.util.List;
import ENTITYS.NguoiDung;

public interface NguoiDungDao {
    List<NguoiDung> findAll(); // Lấy tất cả người dùng
    NguoiDung findById(String id); // Tìm người dùng theo ID
    boolean create(NguoiDung user); // Thêm người dùng mới
    boolean update(NguoiDung user); // Cập nhật thông tin người dùng
    boolean deleteById(String id); // Xóa người dùng theo ID
    List<NguoiDung> findAdmins(); // Tìm danh sách admin
}
