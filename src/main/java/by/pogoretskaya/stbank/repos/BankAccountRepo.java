package by.pogoretskaya.stbank.repos;

import by.pogoretskaya.stbank.domain.BankAccount;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BankAccountRepo extends JpaRepository<BankAccount, Long> {

    BankAccount findByUserAccount(String userAccount);

}