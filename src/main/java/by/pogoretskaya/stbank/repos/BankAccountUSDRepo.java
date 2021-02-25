package by.pogoretskaya.stbank.repos;

import by.pogoretskaya.stbank.domain.BankAccountUSD;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BankAccountUSDRepo extends JpaRepository<BankAccountUSD, Long> {
}
