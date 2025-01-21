package ENTITYS;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "NguoiDung")
public class NguoiDung {

    @Id
    @Column(name = "MaNguoiDung", length = 100)
    private String maNguoiDung;

    @Column(name = "TenNguoiDung", nullable = false, length = 100)
    private String tenNguoiDung;

    @Column(name = "Email", nullable = false, unique = true, length = 100)
    private String email;

    @Column(name = "MatKhau", nullable = false, length = 100)
    private String matKhau;

    @Column(name = "Admin", nullable = false)
    private Boolean admin = false;

    @Temporal(TemporalType.DATE)
    @Column(name = "NgayTao", nullable = false)
    private Date ngayTao;
}
