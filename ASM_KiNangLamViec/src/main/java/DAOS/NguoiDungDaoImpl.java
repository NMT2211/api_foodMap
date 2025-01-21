package DAOS;

import java.util.List;
import ENTITYS.NguoiDung;
import UTILS.XJPA;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class NguoiDungDaoImpl implements NguoiDungDao {

    private EntityManager em = XJPA.getEntityManager();

    @Override
    public List<NguoiDung> findAll() {
        em.clear();
        TypedQuery<NguoiDung> query = em.createQuery("SELECT u FROM NguoiDung u", NguoiDung.class);
        return query.getResultList();
    }

    @Override
    public NguoiDung findById(String id) {
        return em.find(NguoiDung.class, id);
    }

    @Override
    public boolean create(NguoiDung user) {
        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(NguoiDung user) {
        try {
            em.getTransaction().begin();
            em.merge(user);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteById(String id) {
        NguoiDung user = em.find(NguoiDung.class, id);
        if (user == null) {
            return false;
        }
        try {
            em.getTransaction().begin();
            em.remove(user);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<NguoiDung> findAdmins() {
        String jpql = "SELECT u FROM NguoiDung u WHERE u.admin = true";
        TypedQuery<NguoiDung> query = em.createQuery(jpql, NguoiDung.class);
        return query.getResultList();
    }
}
