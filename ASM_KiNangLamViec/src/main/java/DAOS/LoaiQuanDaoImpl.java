package DAOS;

import java.util.List;
import ENTITYS.LoaiQuan;
import UTILS.XJPA;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class LoaiQuanDaoImpl implements LoaiQuanDao {

    private EntityManager em = XJPA.getEntityManager();

    @Override
    public List<LoaiQuan> findAll() {
        em.clear();
        TypedQuery<LoaiQuan> query = em.createQuery("SELECT l FROM LoaiQuan l", LoaiQuan.class);
        return query.getResultList();
    }

    @Override
    public LoaiQuan findById(Integer id) {
        return em.find(LoaiQuan.class, id);
    }

    @Override
    public boolean create(LoaiQuan loaiQuan) {
        try {
            em.getTransaction().begin();
            em.persist(loaiQuan);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(LoaiQuan loaiQuan) {
        try {
            em.getTransaction().begin();
            em.merge(loaiQuan);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteById(Integer id) {
        LoaiQuan loaiQuan = em.find(LoaiQuan.class, id);
        if (loaiQuan == null) {
            return false;
        }
        try {
            em.getTransaction().begin();
            em.remove(loaiQuan);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }
}
