package ENTITYS;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "HinhAnhQuanAn")
public class HinhAnhQuanAn {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaHinhAnh")
    private Integer maHinhAnh;

    @ManyToOne
    @JoinColumn(name = "MaQuanAn", nullable = false)
    private QuanAn quanAn;

    @Column(name = "LinkHinhAnh", nullable = false, length = 255)
    private String linkHinhAnh;
}
