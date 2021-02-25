package by.pogoretskaya.stbank.repos;

import by.pogoretskaya.stbank.domain.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserInfoRepo extends JpaRepository <UserInfo, Long> {
}
