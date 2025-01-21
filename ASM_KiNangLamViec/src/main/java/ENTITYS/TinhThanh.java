package ENTITYS;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "TinhThanh")
public class TinhThanh {

    @Id
    @Column(name = "MaTinhThanh")
    private Integer maTinhThanh;

    @Column(name = "TenTinhThanh", nullable = false, length = 100)
    private String tenTinhThanh;
}
