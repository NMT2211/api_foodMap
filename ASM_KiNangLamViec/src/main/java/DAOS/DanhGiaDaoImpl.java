package DAOS;

import java.util.List;
import ENTITYS.DanhGia;
import UTILS.XJPA;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class DanhGiaDaoImpl implements DanhGiaDao {

    private EntityManager em = XJPA.getEntityManager();

    @Override
    public List<DanhGia> findAll() {
        em.clear();
        TypedQuery<DanhGia> query = em.createQuery("SELECT r FROM DanhGia r", DanhGia.class);
        return query.getResultList();
    }

    @Override
    public DanhGia findById(Integer id) {
        return em.find(DanhGia.class, id);
    }

    @Override
    public boolean create(DanhGia review) {
        try {
            em.getTransaction().begin();
            em.persist(review);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(DanhGia review) {
        try {
            em.getTransaction().begin();
            em.merge(review);
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
        DanhGia review = em.find(DanhGia.class, id);
        if (review == null) {
            return false;
        }
        try {
            em.getTransaction().begin();
            em.remove(review);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<DanhGia> findByQuanAnId(Integer quanAnId) {
        String jpql = "SELECT r FROM DanhGia r WHERE r.quanAn.maQuanAn = :quanAnId";
        TypedQuery<DanhGia> query = em.createQuery(jpql, DanhGia.class);
        query.setParameter("quanAnId", quanAnId);
        return query.getResultList();
    }

    @Override
    public List<DanhGia> findByUserId(String userId) {
        String jpql = "SELECT r FROM DanhGia r WHERE r.nguoiDung.maNguoiDung = :userId";
        TypedQuery<DanhGia> query = em.createQuery(jpql, DanhGia.class);
        query.setParameter("userId", userId);
        return query.getResultList();
    }
}
