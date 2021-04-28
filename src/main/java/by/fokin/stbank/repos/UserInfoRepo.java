package by.fokin.stbank.repos;

import by.fokin.stbank.domain.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserInfoRepo extends JpaRepository <UserInfo, Long> {
}
