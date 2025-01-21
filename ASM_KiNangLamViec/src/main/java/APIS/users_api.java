package APIS;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import DAOS.NguoiDungDao;
import DAOS.NguoiDungDaoImpl;
import ENTITYS.NguoiDung;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({"/users_api", "/users_api/*"})
public class users_api extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final NguoiDungDao userDao = new NguoiDungDaoImpl();

    public users_api() {
        super();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String pathInfo = request.getPathInfo();

            if (pathInfo == null || pathInfo.equals("/")) {
                // Lấy danh sách tất cả người dùng
                List<NguoiDung> users = userDao.findAll();
                JSONArray jsonArray = new JSONArray();
                for (NguoiDung user : users) {
                    jsonArray.put(toJson(user));
                }
                out.print(jsonArray.toString());
            } else {
                // Tìm người dùng theo ID hoặc email
                String idOrEmail = pathInfo.substring(1);
                NguoiDung user = userDao.findById(idOrEmail);

                if (user == null) {
                    sendError(response, HttpServletResponse.SC_NOT_FOUND, "Người dùng không tồn tại.");
                } else {
                    out.print(toJson(user).toString());
                }
            }
        } catch (Exception e) {
            sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi server: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (BufferedReader reader = request.getReader(); PrintWriter out = response.getWriter()) {
            JSONObject inputJson = new JSONObject(readRequestBody(reader));
            String idOrEmail = inputJson.optString("email");
            String password = inputJson.optString("password");

            if (idOrEmail.isEmpty() || password.isEmpty()) {
                sendError(response, HttpServletResponse.SC_BAD_REQUEST, "Email hoặc mật khẩu không được để trống.");
                return;
            }

            NguoiDung user = userDao.findById(idOrEmail);

            if (user == null || !user.getMatKhau().equals(password)) {
                sendError(response, HttpServletResponse.SC_UNAUTHORIZED, "Email hoặc mật khẩu không đúng.");
            } else {
                out.print(toJson(user).toString());
            }
        } catch (Exception e) {
            sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi server: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (BufferedReader reader = request.getReader(); PrintWriter out = response.getWriter()) {
            JSONObject inputJson = new JSONObject(readRequestBody(reader));

            String id = inputJson.optString("id");
            String fullname = inputJson.optString("fullname");
            String email = inputJson.optString("email");
            String password = inputJson.optString("password");

            if (id.isEmpty() || fullname.isEmpty() || email.isEmpty() || password.isEmpty()) {
                sendError(response, HttpServletResponse.SC_BAD_REQUEST, "ID, fullname, email, và password không được để trống.");
                return;
            }

            if (userDao.findById(id) != null) {
                sendError(response, HttpServletResponse.SC_CONFLICT, "Người dùng đã tồn tại với ID này.");
                return;
            }

            NguoiDung newUser = new NguoiDung();
            newUser.setMaNguoiDung(id);
            newUser.setTenNguoiDung(fullname);
            newUser.setEmail(email);
            newUser.setMatKhau(password);
            newUser.setAdmin(false);

            boolean isCreated = userDao.create(newUser);

            if (isCreated) {
                response.setStatus(HttpServletResponse.SC_CREATED);
                JSONObject successResponse = new JSONObject();
                successResponse.put("id", newUser.getMaNguoiDung());
                successResponse.put("message", "Tạo người dùng mới thành công.");
                out.print(successResponse.toString());
            } else {
                sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không thể tạo người dùng mới.");
            }
        } catch (Exception e) {
            sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi server: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private JSONObject toJson(NguoiDung user) {
        JSONObject json = new JSONObject();
        json.put("id", user.getMaNguoiDung());
        json.put("fullname", user.getTenNguoiDung());
        json.put("email", user.getEmail());
        json.put("admin", user.getAdmin());
        json.put("createdDate", user.getNgayTao());
        return json;
    }

    private String readRequestBody(BufferedReader reader) throws IOException {
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        return sb.toString();
    }

    private void sendError(HttpServletResponse response, int statusCode, String message) throws IOException {
        response.setStatus(statusCode);
        JSONObject errorJson = new JSONObject();
        errorJson.put("error", message);
        try (PrintWriter out = response.getWriter()) {
            out.print(errorJson.toString());
        }
    }
}
