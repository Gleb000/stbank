package by.pogoretskaya.stbank.repos;

import by.pogoretskaya.stbank.domain.PiggiBank;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PiggiBankRepo extends JpaRepository<PiggiBank, Long> {
}
