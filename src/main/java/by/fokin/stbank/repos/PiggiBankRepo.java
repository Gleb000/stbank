package by.fokin.stbank.repos;

import by.fokin.stbank.domain.PiggiBank;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PiggiBankRepo extends JpaRepository<PiggiBank, Long> {
}
