package by.fokin.stbank.repos;

import by.fokin.stbank.domain.BankAccountUSD;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BankAccountUSDRepo extends JpaRepository<BankAccountUSD, Long> {
}
