package ENTITYS;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "LoaiQuan")
public class LoaiQuan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaLoaiQuan")
    private Integer maLoaiQuan;

    @Column(name = "TenLoaiQuan", nullable = false, length = 100)
    private String tenLoaiQuan;
}
