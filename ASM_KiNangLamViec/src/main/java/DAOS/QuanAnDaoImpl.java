package DAOS;

import java.util.List;
import ENTITYS.QuanAn;
import UTILS.XJPA;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class QuanAnDaoImpl implements QuanAnDao {

    private EntityManager em = XJPA.getEntityManager();

    @Override
    public List<QuanAn> findAll() {
        em.clear();
        TypedQuery<QuanAn> query = em.createQuery("SELECT q FROM QuanAn q", QuanAn.class);
        return query.getResultList();
    }

    @Override
    public QuanAn findById(Integer id) {
        return em.find(QuanAn.class, id);
    }

    @Override
    public boolean create(QuanAn quanAn) {
        try {
            em.getTransaction().begin();
            em.persist(quanAn);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(QuanAn quanAn) {
        try {
            em.getTransaction().begin();
            em.merge(quanAn);
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
        QuanAn quanAn = em.find(QuanAn.class, id);
        if (quanAn == null) {
            return false;
        }
        try {
            em.getTransaction().begin();
            em.remove(quanAn);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<QuanAn> findByTinhThanhId(Integer tinhThanhId) {
        String jpql = "SELECT q FROM QuanAn q WHERE q.tinhThanh.maTinhThanh = :tinhThanhId";
        TypedQuery<QuanAn> query = em.createQuery(jpql, QuanAn.class);
        query.setParameter("tinhThanhId", tinhThanhId);
        return query.getResultList();
    }

    @Override
    public List<QuanAn> findByLoaiQuanId(Integer loaiQuanId) {
        String jpql = "SELECT q FROM QuanAn q WHERE q.loaiQuan.maLoaiQuan = :loaiQuanId";
        TypedQuery<QuanAn> query = em.createQuery(jpql, QuanAn.class);
        query.setParameter("loaiQuanId", loaiQuanId);
        return query.getResultList();
    }
    
    
  
}
