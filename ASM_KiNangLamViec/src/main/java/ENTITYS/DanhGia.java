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
@Table(name = "DanhGia")
public class DanhGia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaDanhGia")
    private Integer maDanhGia;

    @ManyToOne
    @JoinColumn(name = "MaQuanAn", nullable = false)
    private QuanAn quanAn;

    @ManyToOne
    @JoinColumn(name = "MaNguoiDung", nullable = false)
    private NguoiDung nguoiDung;

    @Column(name = "NoiDungDanhGia", columnDefinition = "TEXT")
    private String noiDungDanhGia;

    @Column(name = "SoSao", nullable = false)
    private Integer soSao;

    @Temporal(TemporalType.DATE)
    @Column(name = "NgayDanhGia", nullable = false)
    private Date ngayDanhGia;
}
