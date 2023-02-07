package Service.ServiceImpl;

import Service.AdminService;
import dao.AdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.Admin;

import java.util.ArrayList;
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;
    @Override
    public ArrayList<Admin> selectAllAdmin() {
        return adminDao.selectAllAdmin();
    }
}
