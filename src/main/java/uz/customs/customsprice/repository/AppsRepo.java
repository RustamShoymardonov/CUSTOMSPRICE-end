package uz.customs.customsprice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import uz.customs.customsprice.entity.InitialDecision.Apps;

import java.util.List;


public interface AppsRepo extends JpaRepository<Apps, String> {
//    List<Apps> findByStatus(int param);

}
