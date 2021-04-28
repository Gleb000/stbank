package by.fokin.stbank.repos;

import by.fokin.stbank.domain.BankAccount;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BankAccountRepo extends JpaRepository<BankAccount, Long> {

    BankAccount findByUserAccount(String userAccount);

}