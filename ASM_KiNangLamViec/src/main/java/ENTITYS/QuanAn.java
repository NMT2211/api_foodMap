package ENTITYS;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "QuanAn")
public class QuanAn {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaQuanAn")
    private Integer maQuanAn;

    @Column(name = "TenQuanAn", nullable = false, length = 200)
    private String tenQuanAn;

    @Column(name = "DiaChi", nullable = false, length = 300)
    private String diaChi;

    @ManyToOne
    @JoinColumn(name = "MaTinhThanh", nullable = false)
    private TinhThanh tinhThanh;

    @ManyToOne
    @JoinColumn(name = "MaLoaiQuan", nullable = false)
    private LoaiQuan loaiQuan;

    @Column(name = "MoTa", columnDefinition = "TEXT")
    private String moTa;

    @Column(name = "LinkGoogleMap", length = 500)
    private String linkGoogleMap;

    @Column(name = "SoDienThoai", length = 15)
    private String soDienThoai;

    @Column(name = "GioMoCua", length = 50)
    private String gioMoCua;

    @Column(name = "GiaTrungBinh", precision = 10)
    private Double giaTrungBinh;

    @Column(name = "DiemDanhGia", precision = 3)
    private Double diemDanhGia;
}
