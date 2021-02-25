package by.pogoretskaya.stbank.repos;

import by.pogoretskaya.stbank.domain.BankCredit;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BankCreditRepo extends JpaRepository<BankCredit, Long> {
}
