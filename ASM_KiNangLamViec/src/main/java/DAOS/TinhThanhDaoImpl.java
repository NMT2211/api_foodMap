package DAOS;

import java.util.List;
import ENTITYS.TinhThanh;
import UTILS.XJPA;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class TinhThanhDaoImpl implements TinhThanhDao {

    private EntityManager em = XJPA.getEntityManager();

    @Override
    public List<TinhThanh> findAll() {
        em.clear();
        TypedQuery<TinhThanh> query = em.createQuery("SELECT t FROM TinhThanh t", TinhThanh.class);
        return query.getResultList();
    }

    @Override
    public TinhThanh findById(Integer id) {
        return em.find(TinhThanh.class, id);
    }

    @Override
    public boolean create(TinhThanh tinhThanh) {
        try {
            em.getTransaction().begin();
            em.persist(tinhThanh);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(TinhThanh tinhThanh) {
        try {
            em.getTransaction().begin();
            em.merge(tinhThanh);
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
        TinhThanh tinhThanh = em.find(TinhThanh.class, id);
        if (tinhThanh == null) {
            return false;
        }
        try {
            em.getTransaction().begin();
            em.remove(tinhThanh);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }
}
