package APIS;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import DAOS.QuanAnDao;
import DAOS.QuanAnDaoImpl;
import ENTITYS.QuanAn;
import ENTITYS.HinhAnhQuanAn;

/**
 * Servlet implementation class listQuanAn_api
 */
@WebServlet({"/listQuanAn_api", "/listQuanAn_api/*"})
public class listQuanAn_api extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final QuanAnDao quanAnDao = new QuanAnDaoImpl();

    public listQuanAn_api() {
        super();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
        response.setHeader("Access-Control-Max-Age", "3600");

        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {
            response.setStatus(HttpServletResponse.SC_OK);
            return;
        }

        super.service(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String pathInfo = request.getPathInfo();

            if (pathInfo == null || pathInfo.equals("/")) {
                List<QuanAn> danhSachQuanAn = quanAnDao.findAll();
                JSONArray jsonArray = new JSONArray();

                for (QuanAn quanAn : danhSachQuanAn) {
                    JSONObject json = new JSONObject();
                    json.put("id", quanAn.getMaQuanAn());
                    json.put("name", quanAn.getTenQuanAn());
                    json.put("address", quanAn.getDiaChi());
                    json.put("province", quanAn.getTinhThanh().getTenTinhThanh());
                    json.put("type", quanAn.getLoaiQuan().getTenLoaiQuan());
                    json.put("description", quanAn.getMoTa());
                    json.put("googleMapLink", quanAn.getLinkGoogleMap());
                    json.put("phone", quanAn.getSoDienThoai());
                    json.put("openingHours", quanAn.getGioMoCua());
                    json.put("averagePrice", quanAn.getGiaTrungBinh());
                    json.put("rating", quanAn.getDiemDanhGia());

                    // Lấy danh sách hình ảnh
                    JSONArray imageArray = new JSONArray();
                    for (HinhAnhQuanAn hinhAnh : quanAn.getHinhAnhList()) {
                        imageArray.put(hinhAnh.getLinkHinhAnh());
                    }
                    json.put("images", imageArray);

                    jsonArray.put(json);
                }
                out.print(jsonArray.toString());
            } else {
                String idStr = pathInfo.substring(1);
                Integer id;

                try {
                    id = Integer.parseInt(idStr);
                } catch (NumberFormatException e) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print(new JSONObject().put("error", "ID không hợp lệ").toString());
                    return;
                }

                QuanAn quanAn = quanAnDao.findById(id);

                if (quanAn == null) {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    out.print(new JSONObject().put("error", "Quán ăn không tồn tại").toString());
                } else {
                    JSONObject json = new JSONObject();
                    json.put("id", quanAn.getMaQuanAn());
                    json.put("name", quanAn.getTenQuanAn());
                    json.put("address", quanAn.getDiaChi());
                    json.put("province", quanAn.getTinhThanh().getTenTinhThanh());
                    json.put("type", quanAn.getLoaiQuan().getTenLoaiQuan());
                    json.put("description", quanAn.getMoTa());
                    json.put("googleMapLink", quanAn.getLinkGoogleMap());
                    json.put("phone", quanAn.getSoDienThoai());
                    json.put("openingHours", quanAn.getGioMoCua());
                    json.put("averagePrice", quanAn.getGiaTrungBinh());
                    json.put("rating", quanAn.getDiemDanhGia());

                    // Lấy danh sách hình ảnh
                    JSONArray imageArray = new JSONArray();
                    for (HinhAnhQuanAn hinhAnh : quanAn.getHinhAnhList()) {
                        imageArray.put(hinhAnh.getLinkHinhAnh());
                    }
                    json.put("images", imageArray);

                    out.print(json.toString());
                }
            }
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            try (PrintWriter out = response.getWriter()) {
                out.print(new JSONObject().put("error", "Lỗi server: " + e.getMessage()).toString());
            }
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        try (PrintWriter out = response.getWriter()) {
            out.print(new JSONObject().put("error", "Phương thức POST không được hỗ trợ.").toString());
        }
    }
}
