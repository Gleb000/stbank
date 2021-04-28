package by.fokin.stbank.repos;

import by.fokin.stbank.domain.BankCredit;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BankCreditRepo extends JpaRepository<BankCredit, Long> {
}
